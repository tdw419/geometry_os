; DESCRIPTION: Composite: Places a blue dot at position (256, 27) then Renders a white line between points (502, 178) and (97, 98) then Draws a magenta circle centered at (362, 110) with radius 25.
; PLAN: r0=256(x), r1=27(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=178(y1), r7=97(x2), r8=98(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=110(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 27
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 502
LDI r6, 178
LDI r7, 97
LDI r8, 98
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 110
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
