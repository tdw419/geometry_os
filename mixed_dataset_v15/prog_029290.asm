; DESCRIPTION: Composite: Sets a single orange pixel at (411, 129) then Places a green line segment connecting (443, 112) to (287, 114) then Creates a red rectangular region at (315, 231) spanning 33 by 16 pixels.
; PLAN: r0=411(x), r1=129(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=443(x1), r6=112(y1), r7=287(x2), r8=114(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=315(x), r11=231(y), r12=33(width), r13=16(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 129
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 443
LDI r6, 112
LDI r7, 287
LDI r8, 114
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 231
LDI r12, 33
LDI r13, 16
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
