; DESCRIPTION: Composite: Sets a single magenta pixel at (113, 230) then Places a cyan line segment connecting (6, 243) to (238, 246).
; PLAN: r0=113(x), r1=230(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=6(x1), r6=243(y1), r7=238(x2), r8=246(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 230
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 6
LDI r6, 243
LDI r7, 238
LDI r8, 246
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
