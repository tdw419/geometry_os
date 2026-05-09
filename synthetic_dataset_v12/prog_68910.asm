; DESCRIPTION: Composite: Places a yellow dot at position (57, 60) then Draws a blue circle centered at (164, 71) with radius 69 then Renders a cyan line between points (363, 11) and (206, 61).
; PLAN: r0=57(x), r1=60(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=164(x), r6=71(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=363(x1), r11=11(y1), r12=206(x2), r13=61(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 60
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 164
LDI r6, 71
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 363
LDI r11, 11
LDI r12, 206
LDI r13, 61
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
