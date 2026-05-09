; DESCRIPTION: Renders a red box of size 25x54 starting at (462, 18).
; PLAN: r0=462(x), r1=18(y), r2=25(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 18
LDI r2, 25
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
