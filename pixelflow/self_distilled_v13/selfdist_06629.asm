; DESCRIPTION: Places a yellow 64x82 box at position (105, 10).
; PLAN: r0=105(x), r1=10(y), r2=64(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 10
LDI r2, 64
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
