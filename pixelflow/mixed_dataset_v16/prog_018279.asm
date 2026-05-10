; DESCRIPTION: Composite: Places a orange dot at position (238, 43) then Renders a blue line between points (50, 232) and (502, 239).
; PLAN: r0=238(x), r1=43(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=50(x1), r6=232(y1), r7=502(x2), r8=239(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 43
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 50
LDI r6, 232
LDI r7, 502
LDI r8, 239
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
