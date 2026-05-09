; DESCRIPTION: Composite: Renders a blue line between points (503, 109) and (68, 255) then Places a red dot at position (24, 125).
; PLAN: r0=503(x1), r1=109(y1), r2=68(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=125(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 503
LDI r1, 109
LDI r2, 68
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 125
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
