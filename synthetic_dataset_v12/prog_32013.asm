; DESCRIPTION: Composite: Renders a green line between points (361, 102) and (346, 4) then Places a white 24x39 rectangle at position (329, 104) then Sets a single black pixel at (457, 255).
; PLAN: r0=361(x1), r1=102(y1), r2=346(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=104(y), r7=24(width), r8=39(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=457(x), r11=255(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 102
LDI r2, 346
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 104
LDI r7, 24
LDI r8, 39
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 255
LDI r12, 0x000000
PSET r10, r11, r12
HALT
