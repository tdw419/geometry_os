; DESCRIPTION: Renders a red box of size 87x18 starting at (98, 119).
; PLAN: r0=98(x), r1=119(y), r2=87(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 119
LDI r2, 87
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
