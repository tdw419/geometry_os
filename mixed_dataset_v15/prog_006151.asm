; DESCRIPTION: Renders a white box of size 92x94 starting at (142, 161).
; PLAN: r0=142(x), r1=161(y), r2=92(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 161
LDI r2, 92
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
