; DESCRIPTION: Composite: Sets a single orange pixel at (380, 204) then Places a magenta line segment connecting (351, 204) to (107, 5) then Draws a cyan rectangle at (243, 175) with width 30 and height 79.
; PLAN: r0=380(x), r1=204(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=351(x1), r6=204(y1), r7=107(x2), r8=5(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=175(y), r12=30(width), r13=79(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 204
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 351
LDI r6, 204
LDI r7, 107
LDI r8, 5
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 175
LDI r12, 30
LDI r13, 79
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
