; DESCRIPTION: Composite: Sets a single purple pixel at (123, 128) then Draws a blue line from (215, 189) to (44, 23).
; PLAN: r0=123(x), r1=128(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=215(x1), r6=189(y1), r7=44(x2), r8=23(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 128
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 215
LDI r6, 189
LDI r7, 44
LDI r8, 23
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
