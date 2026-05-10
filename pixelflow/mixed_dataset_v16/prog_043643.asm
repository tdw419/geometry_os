; DESCRIPTION: Composite: Places a blue dot at position (135, 230) then Places a cyan line segment connecting (238, 161) to (56, 170).
; PLAN: r0=135(x), r1=230(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=238(x1), r6=161(y1), r7=56(x2), r8=170(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 230
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 238
LDI r6, 161
LDI r7, 56
LDI r8, 170
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
