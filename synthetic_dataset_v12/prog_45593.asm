; DESCRIPTION: Composite: Renders a purple box of size 94x71 starting at (139, 45) then Draws a black line from (459, 122) to (352, 167).
; PLAN: r0=139(x), r1=45(y), r2=94(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x1), r6=122(y1), r7=352(x2), r8=167(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 45
LDI r2, 94
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 122
LDI r7, 352
LDI r8, 167
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
