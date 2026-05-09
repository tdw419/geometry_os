; DESCRIPTION: Composite: Places a yellow line segment connecting (409, 182) to (279, 142) then Places a magenta 111x85 rectangle at position (23, 34).
; PLAN: r0=409(x1), r1=182(y1), r2=279(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=34(y), r7=111(width), r8=85(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 182
LDI r2, 279
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 34
LDI r7, 111
LDI r8, 85
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
