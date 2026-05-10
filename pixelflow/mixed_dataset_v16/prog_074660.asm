; DESCRIPTION: Composite: Places a green dot at position (129, 189) then Places a magenta line segment connecting (410, 123) to (141, 63).
; PLAN: r0=129(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=410(x1), r6=123(y1), r7=141(x2), r8=63(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 189
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 410
LDI r6, 123
LDI r7, 141
LDI r8, 63
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
