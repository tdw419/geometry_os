; DESCRIPTION: Composite: Places a magenta dot at position (243, 6) then Renders a cyan line between points (292, 220) and (110, 71).
; PLAN: r0=243(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=292(x1), r6=220(y1), r7=110(x2), r8=71(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 6
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 220
LDI r7, 110
LDI r8, 71
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
