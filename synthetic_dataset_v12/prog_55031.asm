; DESCRIPTION: Places a cyan 85x16 rectangle at position (247, 111).
; PLAN: r0=247(x), r1=111(y), r2=85(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 111
LDI r2, 85
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
