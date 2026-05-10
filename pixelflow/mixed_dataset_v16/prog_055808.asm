; DESCRIPTION: Composite: Sets a single cyan pixel at (70, 21) then Draws a white line from (394, 193) to (437, 100) then Draws a red rectangle at (88, 153) with width 50 and height 55.
; PLAN: r0=70(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=394(x1), r6=193(y1), r7=437(x2), r8=100(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=88(x), r11=153(y), r12=50(width), r13=55(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 21
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 394
LDI r6, 193
LDI r7, 437
LDI r8, 100
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 153
LDI r12, 50
LDI r13, 55
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
