; DESCRIPTION: Composite: Places a red line segment connecting (87, 212) to (129, 82) then Places a black 87x92 rectangle at position (398, 143).
; PLAN: r0=87(x1), r1=212(y1), r2=129(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=143(y), r7=87(width), r8=92(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 212
LDI r2, 129
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 143
LDI r7, 87
LDI r8, 92
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
