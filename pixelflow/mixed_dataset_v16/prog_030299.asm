; DESCRIPTION: Renders a green rectangular region spanning 57 by 22 at (152, 162).
; PLAN: r0=152(x), r1=162(y), r2=57(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 162
LDI r2, 57
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
