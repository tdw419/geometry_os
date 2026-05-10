; DESCRIPTION: Renders a green box of size 61x78 starting at (47, 11).
; PLAN: r0=47(x), r1=11(y), r2=61(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 11
LDI r2, 61
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
