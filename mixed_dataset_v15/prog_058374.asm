; DESCRIPTION: Composite: Places a white line segment connecting (233, 236) to (445, 150) then Draws a cyan rectangle at (382, 166) with width 62 and height 85.
; PLAN: r0=233(x1), r1=236(y1), r2=445(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=166(y), r7=62(width), r8=85(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 236
LDI r2, 445
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 166
LDI r7, 62
LDI r8, 85
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
