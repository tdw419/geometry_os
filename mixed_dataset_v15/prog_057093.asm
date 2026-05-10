; DESCRIPTION: Composite: Sets a single white pixel at (117, 166) then Places a cyan line segment connecting (167, 148) to (87, 0).
; PLAN: r0=117(x), r1=166(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=167(x1), r6=148(y1), r7=87(x2), r8=0(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 166
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 167
LDI r6, 148
LDI r7, 87
LDI r8, 0
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
