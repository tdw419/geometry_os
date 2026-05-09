; DESCRIPTION: Composite: . Then Places a red 33x76 rectangle at position (38, 49). Then Places a red line segment connecting (144, 149) to (2, 29).
; PLAN: r0=38(x), r1=49(y), r2=33(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=144(x1), r1=149(y1), r2=2(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 33x76 rectangle at position (38, 49).
; PLAN: r0=38(x), r1=49(y), r2=33(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 49
LDI r2, 33
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (144, 149) to (2, 29).
; PLAN: r0=144(x1), r1=149(y1), r2=2(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 149
LDI r2, 2
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
