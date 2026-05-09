; DESCRIPTION: Composite: Draws a orange circle centered at (468, 161) with radius 37 then Places a cyan dot at position (15, 82) then Renders a green line between points (132, 58) and (445, 73).
; PLAN: r0=468(x), r1=161(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=82(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=132(x1), r11=58(y1), r12=445(x2), r13=73(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 468
LDI r1, 161
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 82
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 132
LDI r11, 58
LDI r12, 445
LDI r13, 73
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
