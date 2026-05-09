; DESCRIPTION: Composite: Places a magenta line segment connecting (330, 114) to (71, 21) then Places a orange dot at position (394, 63).
; PLAN: r0=330(x1), r1=114(y1), r2=71(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=63(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 114
LDI r2, 71
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 63
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
