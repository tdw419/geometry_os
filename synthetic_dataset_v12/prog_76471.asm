; DESCRIPTION: Composite: Places a yellow circle of radius 24 at center (59, 39) then Renders a white line between points (53, 244) and (139, 14).
; PLAN: r0=59(x), r1=39(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x1), r6=244(y1), r7=139(x2), r8=14(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 39
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 244
LDI r7, 139
LDI r8, 14
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
