; DESCRIPTION: Composite: Renders a cyan disk with center (349, 162) and radius 41 then Draws a magenta line from (226, 34) to (450, 95).
; PLAN: r0=349(x), r1=162(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x1), r6=34(y1), r7=450(x2), r8=95(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 162
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 34
LDI r7, 450
LDI r8, 95
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
