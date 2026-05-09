; DESCRIPTION: Composite: . Then Renders a cyan line between points (161, 73) and (41, 106). Then Renders a red box of size 84x20 starting at (93, 153).
; PLAN: r0=161(x1), r1=73(y1), r2=41(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=93(x), r1=153(y), r2=84(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (161, 73) and (41, 106).
; PLAN: r0=161(x1), r1=73(y1), r2=41(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 73
LDI r2, 41
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 84x20 starting at (93, 153).
; PLAN: r0=93(x), r1=153(y), r2=84(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 153
LDI r2, 84
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
