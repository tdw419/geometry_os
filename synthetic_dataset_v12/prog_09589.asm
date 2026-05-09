; DESCRIPTION: Composite: Draws a purple line from (176, 158) to (431, 189) then Places a cyan 65x47 rectangle at position (293, 109).
; PLAN: r0=176(x1), r1=158(y1), r2=431(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=109(y), r7=65(width), r8=47(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 158
LDI r2, 431
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 109
LDI r7, 65
LDI r8, 47
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
