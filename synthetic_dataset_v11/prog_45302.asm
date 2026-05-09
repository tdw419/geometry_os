; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (178, 107) to (212, 90). Then Places a blue circle of radius 63 at center (193, 98).
; PLAN: r0=178(x1), r1=107(y1), r2=212(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=193(x), r1=98(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (178, 107) to (212, 90).
; PLAN: r0=178(x1), r1=107(y1), r2=212(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 107
LDI r2, 212
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 63 at center (193, 98).
; PLAN: r0=193(x), r1=98(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 98
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
