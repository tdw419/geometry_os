; DESCRIPTION: Composite: Creates a green rectangular region at (415, 111) spanning 18 by 60 pixels then Places a yellow dot at position (415, 79) then Draws a orange line from (370, 193) to (276, 112).
; PLAN: r0=415(x), r1=111(y), r2=18(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=79(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=370(x1), r11=193(y1), r12=276(x2), r13=112(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 111
LDI r2, 18
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 79
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 370
LDI r11, 193
LDI r12, 276
LDI r13, 112
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
