; DESCRIPTION: Renders a green box of size 117x96 starting at (83, 30).
; PLAN: r0=83(x), r1=30(y), r2=117(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 30
LDI r2, 117
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
