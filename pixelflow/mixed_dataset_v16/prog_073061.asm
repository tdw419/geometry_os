; DESCRIPTION: Renders a white box of size 10x96 starting at (335, 4).
; PLAN: r0=335(x), r1=4(y), r2=10(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 4
LDI r2, 10
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
