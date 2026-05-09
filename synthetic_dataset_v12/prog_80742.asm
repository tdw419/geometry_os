; DESCRIPTION: Composite: Places a green dot at position (156, 128) then Places a purple line segment connecting (379, 121) to (445, 237).
; PLAN: r0=156(x), r1=128(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=379(x1), r6=121(y1), r7=445(x2), r8=237(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 128
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 379
LDI r6, 121
LDI r7, 445
LDI r8, 237
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
