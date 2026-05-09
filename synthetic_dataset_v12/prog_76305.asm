; DESCRIPTION: Renders a black box of size 21x78 starting at (450, 35).
; PLAN: r0=450(x), r1=35(y), r2=21(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 35
LDI r2, 21
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
