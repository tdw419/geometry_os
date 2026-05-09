; DESCRIPTION: Composite: Renders a cyan line between points (117, 42) and (422, 193) then Places a cyan dot at position (461, 154).
; PLAN: r0=117(x1), r1=42(y1), r2=422(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=154(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 117
LDI r1, 42
LDI r2, 422
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 154
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
