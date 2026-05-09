; DESCRIPTION: Composite: Renders a green box of size 88x65 starting at (37, 174) then Sets a single magenta pixel at (485, 135).
; PLAN: r0=37(x), r1=174(y), r2=88(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x), r6=135(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 37
LDI r1, 174
LDI r2, 88
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 135
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
