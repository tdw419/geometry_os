; DESCRIPTION: Composite: Places a white dot at position (6, 153) then Renders a blue line between points (395, 117) and (409, 182).
; PLAN: r0=6(x), r1=153(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=395(x1), r6=117(y1), r7=409(x2), r8=182(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 153
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 395
LDI r6, 117
LDI r7, 409
LDI r8, 182
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
