; DESCRIPTION: Renders a yellow box of size 21x79 starting at (229, 22).
; PLAN: r0=229(x), r1=22(y), r2=21(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 22
LDI r2, 21
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
