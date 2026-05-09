; DESCRIPTION: Renders a red box of size 22x74 starting at (306, 14).
; PLAN: r0=306(x), r1=14(y), r2=22(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 14
LDI r2, 22
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
