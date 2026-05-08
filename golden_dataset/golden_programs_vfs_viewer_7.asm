; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
LDI r1, 160       ; x = 160 (right side of desktop)
LDI r14, 32        ; y = 32 (below taskbar)
LDI r6, 64        ; w = 64 pixels wide
LDI r4, 64        ; h = 64 pixels tall
LDI r11, 0         ; title_addr = 0 (no title)
LDI r0, 0         ; WINSYS op=0 (CREATE)
WINSYS r0

; Save window id (r15 has result)
MOV r3, r15

; VFS_BLIT: Paint the filesystem into the window
MOV r15, r3       ; window id
LDI r0, 8         ; WINSYS op=8 (VFS_BLIT)
WINSYS r0

; Spin loop showing the window.
; The files are now visible as pixels on the desktop.
; What you see IS your data.
loop:
  YIELD
  JMP loop
