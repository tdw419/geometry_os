; DESCRIPTION: Composite: Draws a orange rectangle at (388, 37) with width 59 and height 70 then Draws a orange line from (251, 39) to (178, 39).
; PLAN: r0=388(x), r1=37(y), r2=59(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x1), r6=39(y1), r7=178(x2), r8=39(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 37
LDI r2, 59
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 39
LDI r7, 178
LDI r8, 39
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
