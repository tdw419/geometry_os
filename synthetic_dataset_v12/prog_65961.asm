; DESCRIPTION: Composite: Draws a red circle centered at (91, 177) with radius 68 then Draws a orange line from (504, 67) to (267, 92).
; PLAN: r0=91(x), r1=177(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x1), r6=67(y1), r7=267(x2), r8=92(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 177
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 67
LDI r7, 267
LDI r8, 92
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
