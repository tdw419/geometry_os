; DESCRIPTION: Composite: Places a yellow 79x115 rectangle at position (24, 34) then Places a purple line segment connecting (259, 38) to (477, 146).
; PLAN: r0=24(x), r1=34(y), r2=79(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x1), r6=38(y1), r7=477(x2), r8=146(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 34
LDI r2, 79
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 38
LDI r7, 477
LDI r8, 146
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
