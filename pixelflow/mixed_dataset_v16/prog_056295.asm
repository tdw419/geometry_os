; DESCRIPTION: Composite: Draws a purple line from (449, 178) to (410, 153) then Renders a cyan disk with center (267, 84) and radius 74.
; PLAN: r0=449(x1), r1=178(y1), r2=410(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=84(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 178
LDI r2, 410
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 84
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
