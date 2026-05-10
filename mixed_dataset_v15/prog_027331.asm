; DESCRIPTION: Composite: Renders a orange line between points (386, 187) and (193, 223) then Creates a green circular shape at (305, 86) with radius 64.
; PLAN: r0=386(x1), r1=187(y1), r2=193(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=86(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 386
LDI r1, 187
LDI r2, 193
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 86
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
