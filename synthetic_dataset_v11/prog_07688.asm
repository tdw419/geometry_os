; DESCRIPTION: Renders a blue box of size 82x94 starting at (135, 124).
; PLAN: r0=135(x), r1=124(y), r2=82(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 124
LDI r2, 82
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
