; DESCRIPTION: Renders a yellow box of size 91x79 starting at (249, 135).
; PLAN: r0=249(x), r1=135(y), r2=91(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 135
LDI r2, 91
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
