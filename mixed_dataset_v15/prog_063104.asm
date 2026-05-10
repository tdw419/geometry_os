; DESCRIPTION: Composite: Draws a magenta line from (500, 182) to (125, 196) then Renders a orange box of size 70x59 starting at (198, 134) then Sets a single orange pixel at (31, 33).
; PLAN: r0=500(x1), r1=182(y1), r2=125(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=134(y), r7=70(width), r8=59(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=31(x), r11=33(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 500
LDI r1, 182
LDI r2, 125
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 134
LDI r7, 70
LDI r8, 59
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 33
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
