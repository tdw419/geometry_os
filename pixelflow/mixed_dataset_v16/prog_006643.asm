; DESCRIPTION: Composite: Sets a single black pixel at (104, 32) then Places a black 104x39 rectangle at position (403, 179) then Draws a red line from (308, 163) to (251, 199).
; PLAN: r0=104(x), r1=32(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=179(y), r7=104(width), r8=39(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x1), r11=163(y1), r12=251(x2), r13=199(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 32
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 403
LDI r6, 179
LDI r7, 104
LDI r8, 39
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 163
LDI r12, 251
LDI r13, 199
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
