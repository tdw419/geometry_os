; DESCRIPTION: Composite: . Then Draws a magenta line from (190, 104) to (145, 204). Then Creates a cyan rectangular region at (144, 119) spanning 55 by 68 pixels.
; PLAN: r0=190(x1), r1=104(y1), r2=145(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=144(x), r1=119(y), r2=55(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (190, 104) to (145, 204).
; PLAN: r0=190(x1), r1=104(y1), r2=145(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 104
LDI r2, 145
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan rectangular region at (144, 119) spanning 55 by 68 pixels.
; PLAN: r0=144(x), r1=119(y), r2=55(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 119
LDI r2, 55
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
