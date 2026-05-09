; DESCRIPTION: Composite: . Then Places a orange line segment connecting (182, 173) to (110, 131). Then Places a magenta 48x26 rectangle at position (124, 211).
; PLAN: r0=182(x1), r1=173(y1), r2=110(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=124(x), r1=211(y), r2=48(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (182, 173) to (110, 131).
; PLAN: r0=182(x1), r1=173(y1), r2=110(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 173
LDI r2, 110
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta 48x26 rectangle at position (124, 211).
; PLAN: r0=124(x), r1=211(y), r2=48(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 211
LDI r2, 48
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
