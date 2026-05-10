; DESCRIPTION: Composite: Draws a blue rectangle at (89, 38) with width 65 and height 55 then Draws a cyan line from (121, 31) to (464, 180).
; PLAN: r0=89(x), r1=38(y), r2=65(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x1), r6=31(y1), r7=464(x2), r8=180(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 38
LDI r2, 65
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 31
LDI r7, 464
LDI r8, 180
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
