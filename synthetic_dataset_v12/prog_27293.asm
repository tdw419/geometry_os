; DESCRIPTION: Composite: Places a red 81x20 rectangle at position (223, 226) then Renders a blue line between points (352, 33) and (436, 60) then Places a orange dot at position (5, 241).
; PLAN: r0=223(x), r1=226(y), r2=81(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x1), r6=33(y1), r7=436(x2), r8=60(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=5(x), r11=241(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 226
LDI r2, 81
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 33
LDI r7, 436
LDI r8, 60
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 241
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
