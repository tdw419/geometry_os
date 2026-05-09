; DESCRIPTION: Composite: Places a magenta line segment connecting (477, 54) to (295, 132) then Places a blue dot at position (267, 171).
; PLAN: r0=477(x1), r1=54(y1), r2=295(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=171(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 477
LDI r1, 54
LDI r2, 295
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 171
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
