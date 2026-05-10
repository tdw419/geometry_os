; DESCRIPTION: Composite: Creates a orange rectangular region at (197, 90) spanning 55 by 120 pixels then Draws a red line from (321, 206) to (120, 96) then Places a white dot at position (301, 38).
; PLAN: r0=197(x), r1=90(y), r2=55(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=206(y1), r7=120(x2), r8=96(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=38(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 90
LDI r2, 55
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 206
LDI r7, 120
LDI r8, 96
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 38
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
