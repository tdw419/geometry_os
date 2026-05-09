; DESCRIPTION: Composite: Places a blue line segment connecting (0, 64) to (445, 223) then Places a cyan dot at position (205, 89).
; PLAN: r0=0(x1), r1=64(y1), r2=445(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=89(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 0
LDI r1, 64
LDI r2, 445
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 89
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
