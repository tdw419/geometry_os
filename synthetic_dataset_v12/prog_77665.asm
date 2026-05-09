; DESCRIPTION: Composite: Places a blue circle of radius 59 at center (361, 80) then Renders a cyan line between points (50, 234) and (271, 33).
; PLAN: r0=361(x), r1=80(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x1), r6=234(y1), r7=271(x2), r8=33(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 80
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 234
LDI r7, 271
LDI r8, 33
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
