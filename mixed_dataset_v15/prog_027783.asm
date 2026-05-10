; DESCRIPTION: Composite: Places a blue dot at position (426, 139) then Draws a magenta line from (159, 164) to (16, 222).
; PLAN: r0=426(x), r1=139(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=159(x1), r6=164(y1), r7=16(x2), r8=222(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 139
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 164
LDI r7, 16
LDI r8, 222
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
