; DESCRIPTION: Composite: Places a cyan dot at position (58, 137) then Renders a magenta line between points (464, 249) and (509, 236) then Draws a magenta circle centered at (132, 121) with radius 80.
; PLAN: r0=58(x), r1=137(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=464(x1), r6=249(y1), r7=509(x2), r8=236(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=121(y), r12=80(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 137
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 464
LDI r6, 249
LDI r7, 509
LDI r8, 236
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 121
LDI r12, 80
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
