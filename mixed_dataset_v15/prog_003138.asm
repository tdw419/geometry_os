; DESCRIPTION: Composite: Renders a black line between points (411, 79) and (307, 62) then Renders a red disk with center (91, 168) and radius 62.
; PLAN: r0=411(x1), r1=79(y1), r2=307(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=168(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 79
LDI r2, 307
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 168
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
