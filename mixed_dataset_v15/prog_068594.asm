; DESCRIPTION: Composite: Renders a cyan line between points (66, 35) and (253, 240) then Places a cyan dot at position (253, 128).
; PLAN: r0=66(x1), r1=35(y1), r2=253(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=128(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 66
LDI r1, 35
LDI r2, 253
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 128
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
