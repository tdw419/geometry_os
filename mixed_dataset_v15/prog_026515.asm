; DESCRIPTION: Composite: Draws a cyan line from (340, 129) to (309, 149) then Places a blue dot at position (25, 114).
; PLAN: r0=340(x1), r1=129(y1), r2=309(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=114(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 340
LDI r1, 129
LDI r2, 309
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 114
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
