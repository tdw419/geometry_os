; DESCRIPTION: Composite: Renders a blue line between points (197, 127) and (342, 55) then Creates a blue rectangular region at (61, 33) spanning 50 by 77 pixels then Places a white dot at position (111, 32).
; PLAN: r0=197(x1), r1=127(y1), r2=342(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=33(y), r7=50(width), r8=77(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=32(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 127
LDI r2, 342
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 33
LDI r7, 50
LDI r8, 77
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 32
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
