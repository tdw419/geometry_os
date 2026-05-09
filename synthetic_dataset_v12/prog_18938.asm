; DESCRIPTION: Composite: Draws a cyan line from (494, 228) to (381, 146) then Places a blue dot at position (107, 212).
; PLAN: r0=494(x1), r1=228(y1), r2=381(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=212(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 494
LDI r1, 228
LDI r2, 381
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 212
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
