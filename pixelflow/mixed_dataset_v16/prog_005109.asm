; DESCRIPTION: Composite: Creates a cyan circular shape at (292, 184) with radius 65 then Draws a purple line from (66, 16) to (204, 61).
; PLAN: r0=292(x), r1=184(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x1), r6=16(y1), r7=204(x2), r8=61(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 184
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 16
LDI r7, 204
LDI r8, 61
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
