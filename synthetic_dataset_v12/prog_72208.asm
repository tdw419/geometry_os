; DESCRIPTION: Composite: Places a yellow 71x89 rectangle at position (98, 137) then Places a green line segment connecting (262, 236) to (102, 109).
; PLAN: r0=98(x), r1=137(y), r2=71(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x1), r6=236(y1), r7=102(x2), r8=109(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 137
LDI r2, 71
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 236
LDI r7, 102
LDI r8, 109
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
