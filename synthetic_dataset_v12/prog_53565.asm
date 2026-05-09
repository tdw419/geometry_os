; DESCRIPTION: Renders a purple box of size 48x33 starting at (216, 68).
; PLAN: r0=216(x), r1=68(y), r2=48(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 68
LDI r2, 48
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
