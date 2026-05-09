; DESCRIPTION: Composite: . Then Renders a red box of size 102x51 starting at (151, 158). Then Renders a red line between points (248, 76) and (59, 92).
; PLAN: r0=151(x), r1=158(y), r2=102(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=248(x1), r1=76(y1), r2=59(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red box of size 102x51 starting at (151, 158).
; PLAN: r0=151(x), r1=158(y), r2=102(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 158
LDI r2, 102
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (248, 76) and (59, 92).
; PLAN: r0=248(x1), r1=76(y1), r2=59(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 76
LDI r2, 59
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
