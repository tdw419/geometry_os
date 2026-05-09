; DESCRIPTION: Renders a white box of size 92x14 starting at (148, 80).
; PLAN: r0=148(x), r1=80(y), r2=92(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 80
LDI r2, 92
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
