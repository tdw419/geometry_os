; DESCRIPTION: Composite: Places a magenta line segment connecting (444, 251) to (182, 165) then Creates a cyan rectangular region at (164, 53) spanning 75 by 12 pixels.
; PLAN: r0=444(x1), r1=251(y1), r2=182(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=53(y), r7=75(width), r8=12(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 251
LDI r2, 182
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 53
LDI r7, 75
LDI r8, 12
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
