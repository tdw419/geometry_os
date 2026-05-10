; DESCRIPTION: Composite: Places a black 86x61 rectangle at position (146, 178) then Places a green line segment connecting (79, 152) to (274, 161) then Sets a single green pixel at (119, 38).
; PLAN: r0=146(x), r1=178(y), r2=86(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x1), r6=152(y1), r7=274(x2), r8=161(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=119(x), r11=38(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 178
LDI r2, 86
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 152
LDI r7, 274
LDI r8, 161
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 38
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
