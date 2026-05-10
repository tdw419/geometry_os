; DESCRIPTION: Composite: Renders a cyan line between points (300, 93) and (304, 111) then Sets a single yellow pixel at (423, 159) then Creates a yellow rectangular region at (419, 154) spanning 81 by 51 pixels.
; PLAN: r0=300(x1), r1=93(y1), r2=304(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=159(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=154(y), r12=81(width), r13=51(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 93
LDI r2, 304
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 159
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 419
LDI r11, 154
LDI r12, 81
LDI r13, 51
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
