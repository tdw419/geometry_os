; DESCRIPTION: Composite: Places a magenta dot at position (104, 161) then Draws a blue line from (96, 171) to (29, 241).
; PLAN: r0=104(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=96(x1), r6=171(y1), r7=29(x2), r8=241(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 171
LDI r7, 29
LDI r8, 241
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
