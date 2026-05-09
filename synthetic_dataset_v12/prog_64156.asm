; DESCRIPTION: Composite: Draws a white line from (352, 217) to (276, 55) then Renders a yellow box of size 10x25 starting at (459, 220).
; PLAN: r0=352(x1), r1=217(y1), r2=276(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=220(y), r7=10(width), r8=25(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 217
LDI r2, 276
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 220
LDI r7, 10
LDI r8, 25
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
