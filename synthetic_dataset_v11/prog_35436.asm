; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (42, 206) with radius 32. Then Draws a black line from (21, 208) to (35, 172).
; PLAN: r0=42(x), r1=206(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=21(x1), r1=208(y1), r2=35(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (42, 206) with radius 32.
; PLAN: r0=42(x), r1=206(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 206
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (21, 208) to (35, 172).
; PLAN: r0=21(x1), r1=208(y1), r2=35(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 208
LDI r2, 35
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
