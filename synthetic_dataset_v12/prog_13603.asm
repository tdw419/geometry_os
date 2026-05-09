; DESCRIPTION: Composite: Renders a cyan line between points (208, 48) and (493, 39) then Creates a red circular shape at (237, 138) with radius 78.
; PLAN: r0=208(x1), r1=48(y1), r2=493(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=138(y), r7=78(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 208
LDI r1, 48
LDI r2, 493
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 138
LDI r7, 78
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
