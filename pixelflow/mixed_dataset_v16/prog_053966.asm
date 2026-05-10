; DESCRIPTION: Composite: Places a yellow line segment connecting (46, 183) to (72, 92) then Draws a cyan circle centered at (205, 74) with radius 56.
; PLAN: r0=46(x1), r1=183(y1), r2=72(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=74(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 183
LDI r2, 72
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 74
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
