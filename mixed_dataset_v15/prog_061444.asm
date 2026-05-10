; DESCRIPTION: Composite: Draws a cyan rectangle at (149, 213) with width 45 and height 25 then Draws a white line from (233, 246) to (471, 243).
; PLAN: r0=149(x), r1=213(y), r2=45(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x1), r6=246(y1), r7=471(x2), r8=243(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 213
LDI r2, 45
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 246
LDI r7, 471
LDI r8, 243
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
