; DESCRIPTION: Places a green 11x46 box at position (334, 96).
; PLAN: r0=334(x), r1=96(y), r2=11(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 96
LDI r2, 11
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
