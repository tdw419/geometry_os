; DESCRIPTION: Composite: Renders a red line between points (263, 215) and (275, 232) then Creates a white rectangular region at (235, 92) spanning 72 by 18 pixels then Places a purple dot at position (380, 16).
; PLAN: r0=263(x1), r1=215(y1), r2=275(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=92(y), r7=72(width), r8=18(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=380(x), r11=16(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 263
LDI r1, 215
LDI r2, 275
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 92
LDI r7, 72
LDI r8, 18
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 16
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
