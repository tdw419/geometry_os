; DESCRIPTION: Composite: Renders a magenta disk with center (132, 149) and radius 52 then Renders a green line between points (48, 108) and (161, 173).
; PLAN: r0=132(x), r1=149(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x1), r6=108(y1), r7=161(x2), r8=173(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 149
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 108
LDI r7, 161
LDI r8, 173
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
