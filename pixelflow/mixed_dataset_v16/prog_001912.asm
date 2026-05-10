; DESCRIPTION: Composite: Places a cyan dot at position (3, 181) then Renders a black line between points (410, 155) and (502, 107) then Renders a yellow disk with center (42, 63) and radius 22.
; PLAN: r0=3(x), r1=181(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=410(x1), r6=155(y1), r7=502(x2), r8=107(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=42(x), r11=63(y), r12=22(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 3
LDI r1, 181
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 410
LDI r6, 155
LDI r7, 502
LDI r8, 107
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 63
LDI r12, 22
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
