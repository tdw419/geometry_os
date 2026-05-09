; DESCRIPTION: Composite: Draws a magenta line from (216, 138) to (15, 213) then Places a purple circle of radius 27 at center (157, 162).
; PLAN: r0=216(x1), r1=138(y1), r2=15(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=162(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 216
LDI r1, 138
LDI r2, 15
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 162
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
