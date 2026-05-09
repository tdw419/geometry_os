; DESCRIPTION: Composite: Places a green 84x57 rectangle at position (60, 102) then Renders a magenta line between points (472, 111) and (391, 44) then Places a blue dot at position (63, 244).
; PLAN: r0=60(x), r1=102(y), r2=84(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x1), r6=111(y1), r7=391(x2), r8=44(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=63(x), r11=244(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 102
LDI r2, 84
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 111
LDI r7, 391
LDI r8, 44
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 244
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
