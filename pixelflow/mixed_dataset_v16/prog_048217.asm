; DESCRIPTION: Composite: Renders a red disk with center (310, 138) and radius 61 then Places a magenta line segment connecting (19, 120) to (81, 216).
; PLAN: r0=310(x), r1=138(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x1), r6=120(y1), r7=81(x2), r8=216(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 138
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 120
LDI r7, 81
LDI r8, 216
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
