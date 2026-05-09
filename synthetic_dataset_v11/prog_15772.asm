; DESCRIPTION: Composite: . Then Places a blue line segment connecting (184, 59) to (231, 91). Then Places a yellow dot at position (72, 181).
; PLAN: r0=184(x1), r1=59(y1), r2=231(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=72(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (184, 59) to (231, 91).
; PLAN: r0=184(x1), r1=59(y1), r2=231(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 59
LDI r2, 231
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (72, 181).
; PLAN: r0=72(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 181
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
