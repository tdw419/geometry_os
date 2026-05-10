; DESCRIPTION: Composite: Draws a red line from (56, 246) to (459, 86) then Places a blue dot at position (410, 223).
; PLAN: r0=56(x1), r1=246(y1), r2=459(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=223(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 56
LDI r1, 246
LDI r2, 459
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 223
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
