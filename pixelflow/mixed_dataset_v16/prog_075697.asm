; DESCRIPTION: Composite: Renders a orange line between points (468, 254) and (168, 140) then Places a yellow circle of radius 57 at center (337, 71).
; PLAN: r0=468(x1), r1=254(y1), r2=168(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=71(y), r7=57(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 254
LDI r2, 168
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 71
LDI r7, 57
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
