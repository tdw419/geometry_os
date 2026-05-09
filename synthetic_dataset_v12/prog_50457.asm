; DESCRIPTION: Composite: Draws a magenta circle centered at (129, 174) with radius 53 then Draws a yellow line from (445, 173) to (410, 104).
; PLAN: r0=129(x), r1=174(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x1), r6=173(y1), r7=410(x2), r8=104(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 174
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 173
LDI r7, 410
LDI r8, 104
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
