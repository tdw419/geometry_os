; DESCRIPTION: Composite: Renders a cyan line between points (497, 243) and (138, 175) then Places a green dot at position (76, 227).
; PLAN: r0=497(x1), r1=243(y1), r2=138(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=227(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 497
LDI r1, 243
LDI r2, 138
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 227
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
