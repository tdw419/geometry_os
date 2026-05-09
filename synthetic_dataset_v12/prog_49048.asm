; DESCRIPTION: Composite: Draws a blue line from (265, 135) to (264, 96) then Places a magenta circle of radius 44 at center (277, 46).
; PLAN: r0=265(x1), r1=135(y1), r2=264(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=46(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 265
LDI r1, 135
LDI r2, 264
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 46
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
