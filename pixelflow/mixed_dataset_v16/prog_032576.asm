; DESCRIPTION: Composite: Places a orange dot at position (249, 83) then Places a green 83x80 rectangle at position (308, 73) then Places a red line segment connecting (397, 112) to (295, 133).
; PLAN: r0=249(x), r1=83(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=73(y), r7=83(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=397(x1), r11=112(y1), r12=295(x2), r13=133(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 83
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 308
LDI r6, 73
LDI r7, 83
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 112
LDI r12, 295
LDI r13, 133
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
