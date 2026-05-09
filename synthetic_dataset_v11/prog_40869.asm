; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (58, 97) with radius 36. Then Places a red 44x63 rectangle at position (192, 80).
; PLAN: r0=58(x), r1=97(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=192(x), r1=80(y), r2=44(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (58, 97) with radius 36.
; PLAN: r0=58(x), r1=97(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 97
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 44x63 rectangle at position (192, 80).
; PLAN: r0=192(x), r1=80(y), r2=44(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 80
LDI r2, 44
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
