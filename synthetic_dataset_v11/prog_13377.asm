; DESCRIPTION: Renders a red box of size 22x45 starting at (120, 106).
; PLAN: r0=120(x), r1=106(y), r2=22(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 106
LDI r2, 22
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
