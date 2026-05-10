; DESCRIPTION: Renders a red box of size 80x43 starting at (370, 6).
; PLAN: r0=370(x), r1=6(y), r2=80(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 6
LDI r2, 80
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
