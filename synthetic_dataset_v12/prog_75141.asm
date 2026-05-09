; DESCRIPTION: Composite: Sets a single black pixel at (494, 228) then Draws a purple line from (269, 112) to (23, 111) then Places a red 15x47 rectangle at position (8, 82).
; PLAN: r0=494(x), r1=228(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=269(x1), r6=112(y1), r7=23(x2), r8=111(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=8(x), r11=82(y), r12=15(width), r13=47(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 228
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 269
LDI r6, 112
LDI r7, 23
LDI r8, 111
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 8
LDI r11, 82
LDI r12, 15
LDI r13, 47
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
