; DESCRIPTION: Composite: Renders a black line between points (33, 254) and (415, 56) then Places a black dot at position (61, 166).
; PLAN: r0=33(x1), r1=254(y1), r2=415(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=166(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 254
LDI r2, 415
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 166
LDI r7, 0x000000
PSET r5, r6, r7
HALT
