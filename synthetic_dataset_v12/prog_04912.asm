; DESCRIPTION: Composite: Creates a orange rectangular region at (261, 132) spanning 100 by 74 pixels then Draws a magenta line from (464, 50) to (503, 171) then Places a white dot at position (372, 153).
; PLAN: r0=261(x), r1=132(y), r2=100(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x1), r6=50(y1), r7=503(x2), r8=171(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=153(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 261
LDI r1, 132
LDI r2, 100
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 50
LDI r7, 503
LDI r8, 171
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 153
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
