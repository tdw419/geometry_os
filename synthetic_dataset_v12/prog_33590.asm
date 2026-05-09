; DESCRIPTION: Composite: Places a blue dot at position (275, 108) then Renders a magenta line between points (480, 159) and (299, 197).
; PLAN: r0=275(x), r1=108(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=480(x1), r6=159(y1), r7=299(x2), r8=197(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 108
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 480
LDI r6, 159
LDI r7, 299
LDI r8, 197
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
