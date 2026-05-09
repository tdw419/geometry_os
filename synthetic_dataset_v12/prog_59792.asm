; DESCRIPTION: Renders a white box of size 96x104 starting at (132, 46).
; PLAN: r0=132(x), r1=46(y), r2=96(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 46
LDI r2, 96
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
