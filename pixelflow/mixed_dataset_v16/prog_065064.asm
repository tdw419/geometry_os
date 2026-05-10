; DESCRIPTION: Composite: Creates a green circular shape at (74, 161) with radius 35 then Renders a cyan line between points (491, 199) and (480, 59).
; PLAN: r0=74(x), r1=161(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x1), r6=199(y1), r7=480(x2), r8=59(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 161
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 199
LDI r7, 480
LDI r8, 59
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
