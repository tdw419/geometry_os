; DESCRIPTION: Composite: Draws a magenta line from (79, 195) to (200, 123) then Creates a cyan circular shape at (67, 139) with radius 51.
; PLAN: r0=79(x1), r1=195(y1), r2=200(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=139(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 79
LDI r1, 195
LDI r2, 200
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 139
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
