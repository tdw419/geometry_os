; DESCRIPTION: Composite: . Then Places a green 23x110 rectangle at position (34, 4). Then Places a purple dot at position (8, 58).
; PLAN: r0=34(x), r1=4(y), r2=23(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=8(x), r1=58(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green 23x110 rectangle at position (34, 4).
; PLAN: r0=34(x), r1=4(y), r2=23(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 4
LDI r2, 23
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (8, 58).
; PLAN: r0=8(x), r1=58(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 58
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
