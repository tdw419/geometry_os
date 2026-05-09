; DESCRIPTION: Composite: Places a orange dot at position (69, 9) then Draws a green line from (464, 214) to (458, 155).
; PLAN: r0=69(x), r1=9(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=464(x1), r6=214(y1), r7=458(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 9
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 464
LDI r6, 214
LDI r7, 458
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
