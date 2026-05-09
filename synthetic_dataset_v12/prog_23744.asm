; DESCRIPTION: Renders a blue box of size 91x23 starting at (202, 124).
; PLAN: r0=202(x), r1=124(y), r2=91(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 124
LDI r2, 91
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
