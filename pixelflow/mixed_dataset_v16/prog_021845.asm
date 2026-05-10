; DESCRIPTION: Composite: Creates a yellow rectangular region at (135, 196) spanning 85 by 58 pixels then Draws a cyan line from (279, 185) to (487, 82) then Places a orange dot at position (336, 254).
; PLAN: r0=135(x), r1=196(y), r2=85(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x1), r6=185(y1), r7=487(x2), r8=82(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=336(x), r11=254(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 196
LDI r2, 85
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 185
LDI r7, 487
LDI r8, 82
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 254
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
