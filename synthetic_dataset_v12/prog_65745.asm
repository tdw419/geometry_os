; DESCRIPTION: Composite: Places a yellow circle of radius 68 at center (228, 81) then Draws a yellow line from (462, 103) to (258, 249).
; PLAN: r0=228(x), r1=81(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=462(x1), r6=103(y1), r7=258(x2), r8=249(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 81
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 462
LDI r6, 103
LDI r7, 258
LDI r8, 249
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
