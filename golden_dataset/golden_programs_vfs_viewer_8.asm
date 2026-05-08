; DESCRIPTION: A red object centered at the screen with fixed size.

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
LDI r0, 160       ; x = 160 (right side of desktop)
LDI r1, 32        ; y = 32 (below taskbar)
LDI r13, 64        ; w = 64 pixels wide
LDI r10, 64        ; h = 64 pixels tall
LDI r15, 0         ; title_addr = 0 (no title)
LDI r3, 0         ; WINSYS op=0 (CREATE)
WINSYS r3

; Save window id (r6 has result)
MOV r12, r6

; VFS_BLIT: Paint the filesystem into the window
MOV r6, r12       ; window id
LDI r3, 8         ; WINSYS op=8 (VFS_BLIT)
WINSYS r3

; Spin loop showing the window.
; The files are now visible as pixels on the desktop.
; What you see IS your data.
loop:
  YIELD
  JMP loop
