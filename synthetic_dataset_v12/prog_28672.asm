; DESCRIPTION: Places a cyan 32x54 rectangle at position (263, 111).
; PLAN: r0=263(x), r1=111(y), r2=32(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 111
LDI r2, 32
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
