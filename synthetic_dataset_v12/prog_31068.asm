; DESCRIPTION: Composite: Renders a red line between points (53, 65) and (286, 185) then Places a purple 91x88 rectangle at position (46, 37).
; PLAN: r0=53(x1), r1=65(y1), r2=286(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=37(y), r7=91(width), r8=88(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 65
LDI r2, 286
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 37
LDI r7, 91
LDI r8, 88
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
