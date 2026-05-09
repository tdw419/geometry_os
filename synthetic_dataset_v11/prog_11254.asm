; DESCRIPTION: Composite: . Then Places a yellow circle of radius 15 at center (16, 116). Then Places a white line segment connecting (196, 134) to (27, 242).
; PLAN: r0=16(x), r1=116(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=196(x1), r1=134(y1), r2=27(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 15 at center (16, 116).
; PLAN: r0=16(x), r1=116(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 116
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (196, 134) to (27, 242).
; PLAN: r0=196(x1), r1=134(y1), r2=27(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 134
LDI r2, 27
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
