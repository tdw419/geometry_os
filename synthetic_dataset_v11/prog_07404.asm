; DESCRIPTION: Composite: . Then Renders a yellow box of size 113x70 starting at (88, 153). Then Renders a orange line between points (161, 5) and (89, 42).
; PLAN: r0=88(x), r1=153(y), r2=113(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=161(x1), r1=5(y1), r2=89(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 113x70 starting at (88, 153).
; PLAN: r0=88(x), r1=153(y), r2=113(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 153
LDI r2, 113
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (161, 5) and (89, 42).
; PLAN: r0=161(x1), r1=5(y1), r2=89(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 5
LDI r2, 89
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
