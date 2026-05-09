; DESCRIPTION: Composite: . Then Places a yellow circle of radius 23 at center (220, 152). Then Places a black 109x89 rectangle at position (124, 4).
; PLAN: r0=220(x), r1=152(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=124(x), r1=4(y), r2=109(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 23 at center (220, 152).
; PLAN: r0=220(x), r1=152(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 152
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 109x89 rectangle at position (124, 4).
; PLAN: r0=124(x), r1=4(y), r2=109(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 4
LDI r2, 109
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
