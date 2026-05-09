; DESCRIPTION: Composite: Draws a cyan line from (31, 61) to (346, 15) then Places a yellow 116x24 rectangle at position (331, 222) then Sets a single yellow pixel at (305, 140).
; PLAN: r0=31(x1), r1=61(y1), r2=346(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=222(y), r7=116(width), r8=24(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x), r11=140(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 61
LDI r2, 346
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 222
LDI r7, 116
LDI r8, 24
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 140
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
