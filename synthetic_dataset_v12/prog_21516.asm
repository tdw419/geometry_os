; DESCRIPTION: Composite: Draws a red line from (127, 146) to (366, 70) then Places a green circle of radius 54 at center (206, 157).
; PLAN: r0=127(x1), r1=146(y1), r2=366(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=157(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 127
LDI r1, 146
LDI r2, 366
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 157
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
