; DESCRIPTION: Renders a red box of size 20x26 starting at (120, 211).
; PLAN: r0=120(x), r1=211(y), r2=20(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 211
LDI r2, 20
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
