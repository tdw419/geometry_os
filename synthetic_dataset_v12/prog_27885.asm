; DESCRIPTION: Renders a white box of size 81x79 starting at (222, 128).
; PLAN: r0=222(x), r1=128(y), r2=81(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 128
LDI r2, 81
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
