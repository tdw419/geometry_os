; DESCRIPTION: Composite: Renders a black box of size 50x55 starting at (404, 13) then Draws a magenta line from (509, 14) to (238, 49) then Places a red dot at position (345, 66).
; PLAN: r0=404(x), r1=13(y), r2=50(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x1), r6=14(y1), r7=238(x2), r8=49(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=345(x), r11=66(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 13
LDI r2, 50
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 14
LDI r7, 238
LDI r8, 49
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 66
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
