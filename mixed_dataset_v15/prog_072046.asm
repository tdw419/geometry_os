; DESCRIPTION: Composite: Draws a orange line from (220, 5) to (406, 207) then Renders a red disk with center (74, 125) and radius 56.
; PLAN: r0=220(x1), r1=5(y1), r2=406(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=125(y), r7=56(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 5
LDI r2, 406
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 125
LDI r7, 56
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
