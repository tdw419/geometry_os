; DESCRIPTION: Places a yellow 64x64 box at position (83, 200).
; PLAN: r0=83(x), r1=200(y), r2=64(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 200
LDI r2, 64
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
