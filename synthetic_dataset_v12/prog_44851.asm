; DESCRIPTION: Composite: Draws a blue line from (242, 240) to (349, 175) then Draws a magenta circle centered at (64, 146) with radius 60.
; PLAN: r0=242(x1), r1=240(y1), r2=349(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=146(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 240
LDI r2, 349
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 146
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
