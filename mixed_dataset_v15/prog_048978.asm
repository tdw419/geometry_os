; DESCRIPTION: Composite: Creates a orange circular shape at (146, 107) with radius 70 then Draws a yellow line from (434, 74) to (13, 168).
; PLAN: r0=146(x), r1=107(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x1), r6=74(y1), r7=13(x2), r8=168(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 107
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 74
LDI r7, 13
LDI r8, 168
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
