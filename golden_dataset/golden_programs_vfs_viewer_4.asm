; DESCRIPTION: Geometry OS program to draw a red object.

; vfs_viewer.asm -- VFS Pixel Surface Viewer
;
; "Pixels move pixels" -- creates a window and paints the filesystem
; into it as visible colored pixels. Files ARE the pixels.
;
; Uses WINSYS op=8 (VFS_BLIT) to encode all files from .geometry_os/fs/
; as RGBA pixels and blit them directly into the window.
;
; Row 0: Directory index (magic, file count, per-file entries)
; Row 1+: File data as pixels (each pixel = 4 bytes of content)
;
; The user can SEE their files as colored patterns on the desktop.

; Window parameters
LDI r3, 160       ; x = 160 (right side of desktop)
LDI r11, 32        ; y = 32 (below taskbar)
LDI r8, 64        ; w = 64 pixels wide
LDI r5, 64        ; h = 64 pixels tall
LDI r12, 0         ; title_addr = 0 (no title)
LDI r4, 0         ; WINSYS op=0 (CREATE)
WINSYS r4

; Save window id (r10 has result)
MOV r1, r10

; VFS_BLIT: Paint the filesystem into the window
MOV r10, r1       ; window id
LDI r4, 8         ; WINSYS op=8 (VFS_BLIT)
WINSYS r4

; Spin loop showing the window.
; The files are now visible as pixels on the desktop.
; What you see IS your data.
loop:
  YIELD
  JMP loop
