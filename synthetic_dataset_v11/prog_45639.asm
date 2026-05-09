; DESCRIPTION: Composite: . Then Places a red line segment connecting (194, 105) to (21, 106). Then Places a orange 70x72 rectangle at position (35, 25).
; PLAN: r0=194(x1), r1=105(y1), r2=21(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=35(x), r1=25(y), r2=70(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (194, 105) to (21, 106).
; PLAN: r0=194(x1), r1=105(y1), r2=21(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 105
LDI r2, 21
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 70x72 rectangle at position (35, 25).
; PLAN: r0=35(x), r1=25(y), r2=70(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 25
LDI r2, 70
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
