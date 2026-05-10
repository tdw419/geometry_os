; DESCRIPTION: Composite: Places a red dot at position (101, 102) then Draws a white line from (432, 103) to (106, 82) then Draws a cyan circle centered at (81, 111) with radius 63.
; PLAN: r0=101(x), r1=102(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=432(x1), r6=103(y1), r7=106(x2), r8=82(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=81(x), r11=111(y), r12=63(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 101
LDI r1, 102
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 432
LDI r6, 103
LDI r7, 106
LDI r8, 82
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 111
LDI r12, 63
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
