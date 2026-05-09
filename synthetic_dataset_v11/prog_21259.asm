; DESCRIPTION: Composite: . Then Places a green 25x31 rectangle at position (127, 17). Then Creates a purple circular shape at (196, 183) with radius 59.
; PLAN: r0=127(x), r1=17(y), r2=25(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=196(x), r1=183(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 25x31 rectangle at position (127, 17).
; PLAN: r0=127(x), r1=17(y), r2=25(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 17
LDI r2, 25
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (196, 183) with radius 59.
; PLAN: r0=196(x), r1=183(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 183
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
