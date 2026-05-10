; DESCRIPTION: Composite: Places a purple dot at position (64, 99) then Places a yellow line segment connecting (376, 173) to (228, 88).
; PLAN: r0=64(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=376(x1), r6=173(y1), r7=228(x2), r8=88(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 173
LDI r7, 228
LDI r8, 88
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
