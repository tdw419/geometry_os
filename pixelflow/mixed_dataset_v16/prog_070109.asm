; DESCRIPTION: Renders a white box of size 81x48 starting at (36, 94).
; PLAN: r0=36(x), r1=94(y), r2=81(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 94
LDI r2, 81
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
