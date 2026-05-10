; DESCRIPTION: Renders a white box of size 23x74 starting at (112, 32).
; PLAN: r0=112(x), r1=32(y), r2=23(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 32
LDI r2, 23
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
