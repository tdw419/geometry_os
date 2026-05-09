; DESCRIPTION: Composite: Draws a red line from (286, 51) to (433, 43) then Creates a orange rectangular region at (164, 35) spanning 95 by 28 pixels.
; PLAN: r0=286(x1), r1=51(y1), r2=433(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=35(y), r7=95(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 51
LDI r2, 433
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 35
LDI r7, 95
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
