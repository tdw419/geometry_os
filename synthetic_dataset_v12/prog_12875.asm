; DESCRIPTION: Composite: Places a magenta line segment connecting (177, 161) to (386, 39) then Places a yellow dot at position (467, 0).
; PLAN: r0=177(x1), r1=161(y1), r2=386(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=0(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 161
LDI r2, 386
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 0
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
