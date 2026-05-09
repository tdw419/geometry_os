; DESCRIPTION: Composite: Places a yellow dot at position (82, 168) then Places a green line segment connecting (476, 41) to (264, 66).
; PLAN: r0=82(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=476(x1), r6=41(y1), r7=264(x2), r8=66(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 168
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 476
LDI r6, 41
LDI r7, 264
LDI r8, 66
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
