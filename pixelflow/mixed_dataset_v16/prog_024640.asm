; DESCRIPTION: Composite: Sets a single green pixel at (211, 49) then Places a green 27x89 rectangle at position (376, 124) then Renders a cyan line between points (470, 220) and (100, 11).
; PLAN: r0=211(x), r1=49(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=124(y), r7=27(width), r8=89(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x1), r11=220(y1), r12=100(x2), r13=11(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 49
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 376
LDI r6, 124
LDI r7, 27
LDI r8, 89
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 220
LDI r12, 100
LDI r13, 11
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
