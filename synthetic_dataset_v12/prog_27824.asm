; DESCRIPTION: Renders a white box of size 57x14 starting at (448, 19).
; PLAN: r0=448(x), r1=19(y), r2=57(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 19
LDI r2, 57
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
