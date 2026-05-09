; DESCRIPTION: Composite: . Then Places a red line segment connecting (140, 122) to (61, 1). Then Places a yellow 26x17 rectangle at position (170, 42).
; PLAN: r0=140(x1), r1=122(y1), r2=61(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=170(x), r1=42(y), r2=26(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (140, 122) to (61, 1).
; PLAN: r0=140(x1), r1=122(y1), r2=61(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 122
LDI r2, 61
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 26x17 rectangle at position (170, 42).
; PLAN: r0=170(x), r1=42(y), r2=26(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 42
LDI r2, 26
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
