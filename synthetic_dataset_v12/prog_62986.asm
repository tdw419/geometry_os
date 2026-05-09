; DESCRIPTION: Composite: Creates a cyan rectangular region at (428, 59) spanning 58 by 37 pixels then Renders a orange line between points (399, 144) and (479, 47).
; PLAN: r0=428(x), r1=59(y), r2=58(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x1), r6=144(y1), r7=479(x2), r8=47(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 59
LDI r2, 58
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 144
LDI r7, 479
LDI r8, 47
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
