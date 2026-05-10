; DESCRIPTION: Composite: Renders a cyan disk with center (259, 64) and radius 19 then Draws a purple line from (377, 70) to (497, 173).
; PLAN: r0=259(x), r1=64(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=70(y1), r7=497(x2), r8=173(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 64
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 70
LDI r7, 497
LDI r8, 173
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
