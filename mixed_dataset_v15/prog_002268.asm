; DESCRIPTION: Composite: Draws a magenta circle centered at (200, 94) with radius 79 then Renders a green box of size 54x34 starting at (238, 28) then Sets a single magenta pixel at (229, 120).
; PLAN: r0=200(x), r1=94(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x), r6=28(y), r7=54(width), r8=34(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x), r11=120(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 94
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 28
LDI r7, 54
LDI r8, 34
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 120
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
