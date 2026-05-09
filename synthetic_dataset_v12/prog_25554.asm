; DESCRIPTION: Composite: Places a black line segment connecting (207, 69) to (213, 195) then Places a white dot at position (143, 77).
; PLAN: r0=207(x1), r1=69(y1), r2=213(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=77(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 207
LDI r1, 69
LDI r2, 213
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 77
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
