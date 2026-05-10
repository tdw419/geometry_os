; DESCRIPTION: Composite: Renders a yellow line between points (360, 145) and (356, 127) then Creates a cyan circular shape at (151, 79) with radius 75.
; PLAN: r0=360(x1), r1=145(y1), r2=356(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=79(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 145
LDI r2, 356
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 79
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
