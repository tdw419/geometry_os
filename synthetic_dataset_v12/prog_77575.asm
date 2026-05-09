; DESCRIPTION: Composite: Draws a white rectangle at (444, 151) with width 27 and height 75 then Draws a blue line from (240, 9) to (72, 150).
; PLAN: r0=444(x), r1=151(y), r2=27(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x1), r6=9(y1), r7=72(x2), r8=150(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 151
LDI r2, 27
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 9
LDI r7, 72
LDI r8, 150
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
