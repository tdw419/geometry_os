; DESCRIPTION: Composite: Places a magenta dot at position (234, 106) then Draws a cyan line from (304, 46) to (39, 217).
; PLAN: r0=234(x), r1=106(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=304(x1), r6=46(y1), r7=39(x2), r8=217(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 106
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 46
LDI r7, 39
LDI r8, 217
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
