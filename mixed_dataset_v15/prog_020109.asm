; DESCRIPTION: Composite: Places a cyan line segment connecting (76, 158) to (393, 21) then Places a magenta dot at position (74, 161).
; PLAN: r0=76(x1), r1=158(y1), r2=393(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=161(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 76
LDI r1, 158
LDI r2, 393
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 161
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
