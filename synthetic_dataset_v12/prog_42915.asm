; DESCRIPTION: Renders a yellow box of size 99x104 starting at (172, 37).
; PLAN: r0=172(x), r1=37(y), r2=99(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 37
LDI r2, 99
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
