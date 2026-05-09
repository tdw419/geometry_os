; DESCRIPTION: Composite: Draws a white line from (24, 243) to (443, 207) then Places a green dot at position (329, 23).
; PLAN: r0=24(x1), r1=243(y1), r2=443(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=23(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 24
LDI r1, 243
LDI r2, 443
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 23
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
