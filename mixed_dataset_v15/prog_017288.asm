; DESCRIPTION: Composite: Draws a red line from (228, 159) to (202, 163) then Places a blue dot at position (178, 135).
; PLAN: r0=228(x1), r1=159(y1), r2=202(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=135(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 159
LDI r2, 202
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 135
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
