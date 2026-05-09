; DESCRIPTION: Composite: Sets a single green pixel at (307, 161) then Draws a blue line from (67, 92) to (311, 224).
; PLAN: r0=307(x), r1=161(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=67(x1), r6=92(y1), r7=311(x2), r8=224(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 161
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 67
LDI r6, 92
LDI r7, 311
LDI r8, 224
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
