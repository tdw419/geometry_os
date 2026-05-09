; DESCRIPTION: Renders a green box of size 19x35 starting at (152, 71).
; PLAN: r0=152(x), r1=71(y), r2=19(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 71
LDI r2, 19
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
