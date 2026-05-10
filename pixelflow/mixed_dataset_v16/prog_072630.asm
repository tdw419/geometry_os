; DESCRIPTION: Composite: Places a green dot at position (503, 201) then Creates a white rectangular region at (21, 195) spanning 39 by 50 pixels then Places a cyan line segment connecting (162, 69) to (308, 169).
; PLAN: r0=503(x), r1=201(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=21(x), r6=195(y), r7=39(width), r8=50(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x1), r11=69(y1), r12=308(x2), r13=169(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 503
LDI r1, 201
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 21
LDI r6, 195
LDI r7, 39
LDI r8, 50
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 69
LDI r12, 308
LDI r13, 169
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
