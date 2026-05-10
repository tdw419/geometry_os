; DESCRIPTION: Composite: Places a purple dot at position (356, 8) then Draws a black line from (250, 237) to (479, 135).
; PLAN: r0=356(x), r1=8(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=250(x1), r6=237(y1), r7=479(x2), r8=135(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 8
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 250
LDI r6, 237
LDI r7, 479
LDI r8, 135
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
