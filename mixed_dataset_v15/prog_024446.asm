; DESCRIPTION: Composite: Draws a green circle centered at (461, 215) with radius 36 then Places a red 57x15 rectangle at position (152, 219) then Sets a single cyan pixel at (95, 206).
; PLAN: r0=461(x), r1=215(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=219(y), r7=57(width), r8=15(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=95(x), r11=206(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 461
LDI r1, 215
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 219
LDI r7, 57
LDI r8, 15
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 206
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
