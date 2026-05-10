; DESCRIPTION: Composite: Places a cyan line segment connecting (332, 210) to (70, 199) then Sets a single blue pixel at (346, 60).
; PLAN: r0=332(x1), r1=210(y1), r2=70(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=60(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 210
LDI r2, 70
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 60
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
