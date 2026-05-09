; DESCRIPTION: Composite: Sets a single cyan pixel at (408, 146) then Creates a cyan rectangular region at (108, 6) spanning 21 by 43 pixels then Renders a green line between points (154, 253) and (164, 179).
; PLAN: r0=408(x), r1=146(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=6(y), r7=21(width), r8=43(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x1), r11=253(y1), r12=164(x2), r13=179(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 146
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 108
LDI r6, 6
LDI r7, 21
LDI r8, 43
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 253
LDI r12, 164
LDI r13, 179
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
