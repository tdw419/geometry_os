; DESCRIPTION: Composite: Sets a single yellow pixel at (158, 221) then Draws a cyan line from (509, 133) to (109, 197).
; PLAN: r0=158(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=509(x1), r6=133(y1), r7=109(x2), r8=197(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 221
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 509
LDI r6, 133
LDI r7, 109
LDI r8, 197
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
