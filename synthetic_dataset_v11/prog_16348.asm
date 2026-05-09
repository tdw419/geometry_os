; DESCRIPTION: Composite: . Then Places a green line segment connecting (7, 154) to (62, 168). Then Places a orange circle of radius 71 at center (120, 82).
; PLAN: r0=7(x1), r1=154(y1), r2=62(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=120(x), r1=82(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (7, 154) to (62, 168).
; PLAN: r0=7(x1), r1=154(y1), r2=62(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 154
LDI r2, 62
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 71 at center (120, 82).
; PLAN: r0=120(x), r1=82(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 82
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
