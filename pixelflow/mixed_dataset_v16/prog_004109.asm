; DESCRIPTION: Composite: Renders a cyan line between points (457, 114) and (421, 103) then Places a orange dot at position (109, 59).
; PLAN: r0=457(x1), r1=114(y1), r2=421(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=59(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 457
LDI r1, 114
LDI r2, 421
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 59
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
