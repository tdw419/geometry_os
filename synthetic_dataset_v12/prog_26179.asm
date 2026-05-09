; DESCRIPTION: Composite: Places a white dot at position (409, 171) then Draws a magenta line from (230, 26) to (450, 146).
; PLAN: r0=409(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=230(x1), r6=26(y1), r7=450(x2), r8=146(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 171
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 26
LDI r7, 450
LDI r8, 146
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
