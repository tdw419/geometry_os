; DESCRIPTION: Composite: Sets a single blue pixel at (464, 143) then Places a green line segment connecting (113, 87) to (440, 20).
; PLAN: r0=464(x), r1=143(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=113(x1), r6=87(y1), r7=440(x2), r8=20(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 143
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 113
LDI r6, 87
LDI r7, 440
LDI r8, 20
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
