; DESCRIPTION: Composite: Draws a cyan line from (102, 212) to (125, 210) then Draws a cyan rectangle at (203, 115) with width 38 and height 114.
; PLAN: r0=102(x1), r1=212(y1), r2=125(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=115(y), r7=38(width), r8=114(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 212
LDI r2, 125
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 115
LDI r7, 38
LDI r8, 114
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
