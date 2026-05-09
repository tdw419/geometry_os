; DESCRIPTION: Composite: . Then Renders a black box of size 118x76 starting at (105, 171). Then Places a red line segment connecting (38, 81) to (214, 13).
; PLAN: r0=105(x), r1=171(y), r2=118(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=38(x1), r1=81(y1), r2=214(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 118x76 starting at (105, 171).
; PLAN: r0=105(x), r1=171(y), r2=118(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 171
LDI r2, 118
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (38, 81) to (214, 13).
; PLAN: r0=38(x1), r1=81(y1), r2=214(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 81
LDI r2, 214
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
