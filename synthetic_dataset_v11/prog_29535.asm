; DESCRIPTION: Renders a green box of size 40x88 starting at (152, 117).
; PLAN: r0=152(x), r1=117(y), r2=40(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 117
LDI r2, 40
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
