; DESCRIPTION: Composite: Draws a white line from (75, 39) to (375, 44) then Renders a white box of size 75x24 starting at (83, 91).
; PLAN: r0=75(x1), r1=39(y1), r2=375(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=91(y), r7=75(width), r8=24(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 39
LDI r2, 375
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 91
LDI r7, 75
LDI r8, 24
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
