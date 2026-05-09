; DESCRIPTION: Composite: . Then Places a cyan circle of radius 44 at center (80, 64). Then Places a yellow 13x117 rectangle at position (151, 99).
; PLAN: r0=80(x), r1=64(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=151(x), r1=99(y), r2=13(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 44 at center (80, 64).
; PLAN: r0=80(x), r1=64(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 64
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 13x117 rectangle at position (151, 99).
; PLAN: r0=151(x), r1=99(y), r2=13(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 99
LDI r2, 13
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
