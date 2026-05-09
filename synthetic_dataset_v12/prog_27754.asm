; DESCRIPTION: Composite: Draws a blue line from (93, 92) to (153, 19) then Places a green 58x57 rectangle at position (184, 21) then Sets a single orange pixel at (417, 204).
; PLAN: r0=93(x1), r1=92(y1), r2=153(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=21(y), r7=58(width), r8=57(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x), r11=204(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 93
LDI r1, 92
LDI r2, 153
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 21
LDI r7, 58
LDI r8, 57
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 204
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
