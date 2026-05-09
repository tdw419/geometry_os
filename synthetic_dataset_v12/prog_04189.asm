; DESCRIPTION: Composite: Places a cyan dot at position (206, 102) then Renders a orange box of size 34x54 starting at (264, 72) then Places a red line segment connecting (16, 16) to (367, 106).
; PLAN: r0=206(x), r1=102(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=72(y), r7=34(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=16(x1), r11=16(y1), r12=367(x2), r13=106(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 206
LDI r1, 102
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 264
LDI r6, 72
LDI r7, 34
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 16
LDI r11, 16
LDI r12, 367
LDI r13, 106
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
