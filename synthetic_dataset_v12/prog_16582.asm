; DESCRIPTION: Composite: Creates a blue circular shape at (65, 125) with radius 61 then Draws a cyan line from (96, 160) to (138, 161).
; PLAN: r0=65(x), r1=125(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x1), r6=160(y1), r7=138(x2), r8=161(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 125
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 160
LDI r7, 138
LDI r8, 161
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
