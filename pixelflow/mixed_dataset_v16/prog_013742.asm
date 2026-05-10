; DESCRIPTION: Composite: Places a white circle of radius 44 at center (459, 55) then Draws a magenta line from (431, 166) to (197, 141).
; PLAN: r0=459(x), r1=55(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x1), r6=166(y1), r7=197(x2), r8=141(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 55
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 166
LDI r7, 197
LDI r8, 141
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
