; DESCRIPTION: Composite: . Then Draws a orange line from (98, 254) to (228, 164). Then Places a green circle of radius 69 at center (95, 163).
; PLAN: r0=98(x1), r1=254(y1), r2=228(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=163(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (98, 254) to (228, 164).
; PLAN: r0=98(x1), r1=254(y1), r2=228(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 254
LDI r2, 228
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 69 at center (95, 163).
; PLAN: r0=95(x), r1=163(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 163
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
