; DESCRIPTION: Composite: Renders a magenta line between points (23, 85) and (67, 188) then Creates a cyan rectangular region at (207, 164) spanning 21 by 33 pixels.
; PLAN: r0=23(x1), r1=85(y1), r2=67(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=164(y), r7=21(width), r8=33(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 85
LDI r2, 67
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 164
LDI r7, 21
LDI r8, 33
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
