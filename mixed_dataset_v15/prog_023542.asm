; DESCRIPTION: Composite: Renders a yellow line between points (401, 104) and (495, 241) then Places a white 18x109 rectangle at position (279, 64).
; PLAN: r0=401(x1), r1=104(y1), r2=495(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=64(y), r7=18(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 104
LDI r2, 495
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 64
LDI r7, 18
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
