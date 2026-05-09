; DESCRIPTION: Composite: Renders a yellow disk with center (220, 153) and radius 65 then Draws a yellow line from (329, 107) to (397, 88).
; PLAN: r0=220(x), r1=153(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=107(y1), r7=397(x2), r8=88(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 153
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 107
LDI r7, 397
LDI r8, 88
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
