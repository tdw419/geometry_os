; DESCRIPTION: Composite: Draws a yellow line from (372, 214) to (138, 4) then Draws a magenta circle centered at (247, 124) with radius 59.
; PLAN: r0=372(x1), r1=214(y1), r2=138(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=124(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 214
LDI r2, 138
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 124
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
