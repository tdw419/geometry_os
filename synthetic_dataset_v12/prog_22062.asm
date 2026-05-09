; DESCRIPTION: Composite: Sets a single magenta pixel at (176, 243) then Draws a cyan line from (248, 95) to (16, 209).
; PLAN: r0=176(x), r1=243(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=248(x1), r6=95(y1), r7=16(x2), r8=209(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 243
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 248
LDI r6, 95
LDI r7, 16
LDI r8, 209
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
