; DESCRIPTION: Composite: Places a magenta line segment connecting (392, 53) to (289, 33) then Places a cyan dot at position (99, 245).
; PLAN: r0=392(x1), r1=53(y1), r2=289(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=245(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 392
LDI r1, 53
LDI r2, 289
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 245
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
