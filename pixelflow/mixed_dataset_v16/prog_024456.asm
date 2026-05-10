; DESCRIPTION: Composite: Renders a green line between points (126, 35) and (279, 35) then Renders a orange disk with center (166, 168) and radius 48.
; PLAN: r0=126(x1), r1=35(y1), r2=279(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=168(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 126
LDI r1, 35
LDI r2, 279
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 168
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
