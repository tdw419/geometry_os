; DESCRIPTION: Composite: Places a cyan dot at position (263, 126) then Creates a orange rectangular region at (68, 205) spanning 21 by 17 pixels then Places a white line segment connecting (294, 193) to (230, 7).
; PLAN: r0=263(x), r1=126(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=205(y), r7=21(width), r8=17(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=294(x1), r11=193(y1), r12=230(x2), r13=7(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 126
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 205
LDI r7, 21
LDI r8, 17
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 193
LDI r12, 230
LDI r13, 7
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
