; DESCRIPTION: Renders a green box of size 89x21 starting at (47, 218).
; PLAN: r0=47(x), r1=218(y), r2=89(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 218
LDI r2, 89
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
