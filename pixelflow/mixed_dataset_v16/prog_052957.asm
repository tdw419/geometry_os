; DESCRIPTION: Composite: Renders a cyan line between points (140, 47) and (352, 17) then Places a magenta dot at position (165, 229).
; PLAN: r0=140(x1), r1=47(y1), r2=352(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=229(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 140
LDI r1, 47
LDI r2, 352
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 229
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
