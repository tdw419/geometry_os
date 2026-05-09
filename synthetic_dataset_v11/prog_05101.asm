; DESCRIPTION: Composite: . Then Places a orange line segment connecting (101, 167) to (159, 18). Then Places a yellow 104x61 rectangle at position (95, 95).
; PLAN: r0=101(x1), r1=167(y1), r2=159(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=95(y), r2=104(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (101, 167) to (159, 18).
; PLAN: r0=101(x1), r1=167(y1), r2=159(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 167
LDI r2, 159
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 104x61 rectangle at position (95, 95).
; PLAN: r0=95(x), r1=95(y), r2=104(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 95
LDI r2, 104
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
