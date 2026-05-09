; DESCRIPTION: Renders a yellow box of size 68x104 starting at (52, 46).
; PLAN: r0=52(x), r1=46(y), r2=68(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 46
LDI r2, 68
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
