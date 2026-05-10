; DESCRIPTION: Composite: Places a green line segment connecting (425, 60) to (458, 113) then Places a magenta dot at position (173, 51).
; PLAN: r0=425(x1), r1=60(y1), r2=458(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=51(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 425
LDI r1, 60
LDI r2, 458
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 51
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
