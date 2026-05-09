; DESCRIPTION: Composite: Places a yellow dot at position (342, 5) then Renders a yellow line between points (377, 117) and (503, 55).
; PLAN: r0=342(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=377(x1), r6=117(y1), r7=503(x2), r8=55(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 377
LDI r6, 117
LDI r7, 503
LDI r8, 55
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
