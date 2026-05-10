; DESCRIPTION: Composite: Renders a white box of size 30x100 starting at (431, 47) then Draws a orange line from (449, 150) to (391, 57).
; PLAN: r0=431(x), r1=47(y), r2=30(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x1), r6=150(y1), r7=391(x2), r8=57(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 47
LDI r2, 30
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 150
LDI r7, 391
LDI r8, 57
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
