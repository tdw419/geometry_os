; DESCRIPTION: Places a cyan 87x32 rectangle at position (279, 111).
; PLAN: r0=279(x), r1=111(y), r2=87(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 111
LDI r2, 87
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
