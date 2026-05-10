; DESCRIPTION: Composite: Sets a single green pixel at (436, 36) then Draws a blue line from (377, 80) to (53, 111).
; PLAN: r0=436(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=377(x1), r6=80(y1), r7=53(x2), r8=111(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 36
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 377
LDI r6, 80
LDI r7, 53
LDI r8, 111
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
