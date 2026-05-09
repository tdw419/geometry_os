; DESCRIPTION: Composite: Draws a red line from (238, 240) to (392, 174) then Places a orange dot at position (169, 168).
; PLAN: r0=238(x1), r1=240(y1), r2=392(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=168(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 240
LDI r2, 392
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 168
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
