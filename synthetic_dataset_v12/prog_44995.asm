; DESCRIPTION: Composite: Draws a red line from (24, 78) to (370, 44) then Places a white 20x27 rectangle at position (112, 39).
; PLAN: r0=24(x1), r1=78(y1), r2=370(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=39(y), r7=20(width), r8=27(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 78
LDI r2, 370
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 39
LDI r7, 20
LDI r8, 27
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
