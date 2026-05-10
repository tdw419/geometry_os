; DESCRIPTION: Composite: Places a cyan line segment connecting (97, 140) to (481, 63) then Places a green dot at position (410, 147).
; PLAN: r0=97(x1), r1=140(y1), r2=481(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=147(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 140
LDI r2, 481
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 147
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
