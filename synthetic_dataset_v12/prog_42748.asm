; DESCRIPTION: Composite: Creates a orange rectangular region at (432, 113) spanning 57 by 59 pixels then Places a cyan line segment connecting (409, 212) to (145, 1) then Places a yellow dot at position (153, 42).
; PLAN: r0=432(x), r1=113(y), r2=57(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x1), r6=212(y1), r7=145(x2), r8=1(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=42(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 432
LDI r1, 113
LDI r2, 57
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 212
LDI r7, 145
LDI r8, 1
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 42
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
