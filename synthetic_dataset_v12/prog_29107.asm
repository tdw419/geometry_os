; DESCRIPTION: Composite: Renders a cyan line between points (280, 23) and (482, 132) then Draws a purple rectangle at (134, 15) with width 43 and height 64.
; PLAN: r0=280(x1), r1=23(y1), r2=482(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=15(y), r7=43(width), r8=64(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 23
LDI r2, 482
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 15
LDI r7, 43
LDI r8, 64
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
