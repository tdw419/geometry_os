; DESCRIPTION: Composite: Creates a green circular shape at (151, 80) with radius 34 then Draws a red line from (231, 47) to (131, 87).
; PLAN: r0=151(x), r1=80(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x1), r6=47(y1), r7=131(x2), r8=87(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 80
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 47
LDI r7, 131
LDI r8, 87
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
