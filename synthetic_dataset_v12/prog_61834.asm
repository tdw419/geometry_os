; DESCRIPTION: Composite: Sets a single purple pixel at (298, 227) then Places a black 79x63 rectangle at position (178, 95) then Renders a green line between points (26, 3) and (425, 113).
; PLAN: r0=298(x), r1=227(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=95(y), r7=79(width), r8=63(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=26(x1), r11=3(y1), r12=425(x2), r13=113(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 227
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 95
LDI r7, 79
LDI r8, 63
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 3
LDI r12, 425
LDI r13, 113
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
