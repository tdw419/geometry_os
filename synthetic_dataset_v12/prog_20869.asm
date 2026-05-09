; DESCRIPTION: Composite: Draws a cyan line from (220, 68) to (118, 85) then Places a magenta dot at position (100, 109).
; PLAN: r0=220(x1), r1=68(y1), r2=118(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=109(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 68
LDI r2, 118
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 109
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
