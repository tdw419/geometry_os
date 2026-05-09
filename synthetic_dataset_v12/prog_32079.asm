; DESCRIPTION: Composite: Places a blue dot at position (457, 211) then Renders a blue line between points (213, 81) and (13, 210).
; PLAN: r0=457(x), r1=211(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=213(x1), r6=81(y1), r7=13(x2), r8=210(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 457
LDI r1, 211
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 213
LDI r6, 81
LDI r7, 13
LDI r8, 210
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
