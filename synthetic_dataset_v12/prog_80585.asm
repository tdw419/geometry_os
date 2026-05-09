; DESCRIPTION: Renders a red box of size 93x43 starting at (333, 110).
; PLAN: r0=333(x), r1=110(y), r2=93(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 110
LDI r2, 93
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
