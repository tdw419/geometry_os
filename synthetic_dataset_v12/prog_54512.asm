; DESCRIPTION: Composite: Places a magenta 63x48 rectangle at position (260, 15) then Places a blue line segment connecting (271, 139) to (357, 88).
; PLAN: r0=260(x), r1=15(y), r2=63(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x1), r6=139(y1), r7=357(x2), r8=88(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 15
LDI r2, 63
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 139
LDI r7, 357
LDI r8, 88
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
