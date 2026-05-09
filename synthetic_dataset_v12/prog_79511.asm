; DESCRIPTION: Composite: Places a cyan line segment connecting (320, 40) to (464, 239) then Sets a single blue pixel at (364, 178).
; PLAN: r0=320(x1), r1=40(y1), r2=464(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=178(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 40
LDI r2, 464
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 178
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
