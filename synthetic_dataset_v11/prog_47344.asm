; DESCRIPTION: Composite: . Then Renders a purple line between points (105, 151) and (69, 94). Then Renders a red box of size 108x100 starting at (62, 141).
; PLAN: r0=105(x1), r1=151(y1), r2=69(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=141(y), r2=108(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (105, 151) and (69, 94).
; PLAN: r0=105(x1), r1=151(y1), r2=69(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 151
LDI r2, 69
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 108x100 starting at (62, 141).
; PLAN: r0=62(x), r1=141(y), r2=108(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 141
LDI r2, 108
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
