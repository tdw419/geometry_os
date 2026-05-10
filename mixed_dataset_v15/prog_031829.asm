; DESCRIPTION: Composite: Places a yellow dot at position (13, 107) then Places a green circle of radius 69 at center (235, 82) then Draws a red line from (111, 83) to (465, 57).
; PLAN: r0=13(x), r1=107(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=82(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=111(x1), r11=83(y1), r12=465(x2), r13=57(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 107
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 235
LDI r6, 82
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 111
LDI r11, 83
LDI r12, 465
LDI r13, 57
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
