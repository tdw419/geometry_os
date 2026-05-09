; DESCRIPTION: Composite: Places a orange dot at position (326, 244) then Renders a red line between points (266, 249) and (239, 80).
; PLAN: r0=326(x), r1=244(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=266(x1), r6=249(y1), r7=239(x2), r8=80(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 244
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 266
LDI r6, 249
LDI r7, 239
LDI r8, 80
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
