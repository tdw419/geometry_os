; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (131, 219) with radius 29. Then Draws a cyan line from (154, 125) to (10, 179).
; PLAN: r0=131(x), r1=219(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=154(x1), r1=125(y1), r2=10(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (131, 219) with radius 29.
; PLAN: r0=131(x), r1=219(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 219
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (154, 125) to (10, 179).
; PLAN: r0=154(x1), r1=125(y1), r2=10(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 125
LDI r2, 10
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
