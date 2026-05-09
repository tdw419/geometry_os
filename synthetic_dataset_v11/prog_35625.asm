; DESCRIPTION: Composite: . Then Places a orange 10x35 rectangle at position (167, 123). Then Places a red line segment connecting (101, 109) to (138, 98).
; PLAN: r0=167(x), r1=123(y), r2=10(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=101(x1), r1=109(y1), r2=138(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange 10x35 rectangle at position (167, 123).
; PLAN: r0=167(x), r1=123(y), r2=10(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 123
LDI r2, 10
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (101, 109) to (138, 98).
; PLAN: r0=101(x1), r1=109(y1), r2=138(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 109
LDI r2, 138
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
