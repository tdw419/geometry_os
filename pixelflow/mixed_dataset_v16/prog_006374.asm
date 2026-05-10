; DESCRIPTION: Composite: Places a orange circle of radius 50 at center (73, 74) then Draws a yellow line from (138, 153) to (82, 190).
; PLAN: r0=73(x), r1=74(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x1), r6=153(y1), r7=82(x2), r8=190(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 74
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 153
LDI r7, 82
LDI r8, 190
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
