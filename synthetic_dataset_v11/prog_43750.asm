; DESCRIPTION: Composite: . Then Renders a red box of size 56x110 starting at (49, 133). Then Renders a yellow line between points (187, 153) and (184, 105).
; PLAN: r0=49(x), r1=133(y), r2=56(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=187(x1), r1=153(y1), r2=184(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red box of size 56x110 starting at (49, 133).
; PLAN: r0=49(x), r1=133(y), r2=56(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 133
LDI r2, 56
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow line between points (187, 153) and (184, 105).
; PLAN: r0=187(x1), r1=153(y1), r2=184(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 153
LDI r2, 184
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
