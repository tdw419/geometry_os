; DESCRIPTION: Composite: Sets a single purple pixel at (355, 193) then Places a purple 109x48 rectangle at position (371, 107) then Renders a white line between points (151, 142) and (230, 111).
; PLAN: r0=355(x), r1=193(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=107(y), r7=109(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=151(x1), r11=142(y1), r12=230(x2), r13=111(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 193
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 107
LDI r7, 109
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 142
LDI r12, 230
LDI r13, 111
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
