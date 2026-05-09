; DESCRIPTION: Composite: Renders a magenta disk with center (305, 214) and radius 29 then Draws a orange line from (197, 70) to (292, 33).
; PLAN: r0=305(x), r1=214(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x1), r6=70(y1), r7=292(x2), r8=33(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 214
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 70
LDI r7, 292
LDI r8, 33
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
