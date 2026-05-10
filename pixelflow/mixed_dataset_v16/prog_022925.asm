; DESCRIPTION: Composite: Renders a white box of size 90x81 starting at (212, 154) then Draws a blue line from (65, 215) to (79, 189) then Places a black dot at position (19, 102).
; PLAN: r0=212(x), r1=154(y), r2=90(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x1), r6=215(y1), r7=79(x2), r8=189(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=19(x), r11=102(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 212
LDI r1, 154
LDI r2, 90
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 215
LDI r7, 79
LDI r8, 189
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 102
LDI r12, 0x000000
PSET r10, r11, r12
HALT
