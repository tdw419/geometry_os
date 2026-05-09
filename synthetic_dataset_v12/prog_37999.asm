; DESCRIPTION: Composite: Sets a single magenta pixel at (295, 157) then Renders a white line between points (500, 214) and (13, 20).
; PLAN: r0=295(x), r1=157(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=500(x1), r6=214(y1), r7=13(x2), r8=20(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 157
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 500
LDI r6, 214
LDI r7, 13
LDI r8, 20
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
