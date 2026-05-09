; DESCRIPTION: Renders a red box of size 25x71 starting at (317, 122).
; PLAN: r0=317(x), r1=122(y), r2=25(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 122
LDI r2, 25
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
