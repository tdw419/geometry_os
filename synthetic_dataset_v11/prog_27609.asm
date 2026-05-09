; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (63, 168) with radius 52. Then Places a green 20x31 rectangle at position (112, 151).
; PLAN: r0=63(x), r1=168(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=112(x), r1=151(y), r2=20(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (63, 168) with radius 52.
; PLAN: r0=63(x), r1=168(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 168
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 20x31 rectangle at position (112, 151).
; PLAN: r0=112(x), r1=151(y), r2=20(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 151
LDI r2, 20
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
