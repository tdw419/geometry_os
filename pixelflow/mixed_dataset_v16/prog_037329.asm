; DESCRIPTION: Composite: Sets a single purple pixel at (410, 83) then Draws a blue line from (505, 203) to (460, 135).
; PLAN: r0=410(x), r1=83(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=505(x1), r6=203(y1), r7=460(x2), r8=135(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 83
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 505
LDI r6, 203
LDI r7, 460
LDI r8, 135
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
