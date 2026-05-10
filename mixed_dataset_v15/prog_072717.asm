; DESCRIPTION: Renders a white box of size 14x94 starting at (124, 36).
; PLAN: r0=124(x), r1=36(y), r2=14(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 36
LDI r2, 14
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
