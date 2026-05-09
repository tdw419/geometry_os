; DESCRIPTION: Composite: Renders a black line between points (92, 196) and (92, 247) then Places a cyan dot at position (138, 94).
; PLAN: r0=92(x1), r1=196(y1), r2=92(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=94(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 196
LDI r2, 92
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 94
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
