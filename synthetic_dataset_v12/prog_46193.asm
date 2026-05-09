; DESCRIPTION: Composite: Sets a single blue pixel at (67, 236) then Draws a cyan line from (469, 130) to (8, 49).
; PLAN: r0=67(x), r1=236(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=469(x1), r6=130(y1), r7=8(x2), r8=49(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 236
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 469
LDI r6, 130
LDI r7, 8
LDI r8, 49
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
