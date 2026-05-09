; DESCRIPTION: Composite: Places a magenta 73x109 rectangle at position (44, 25) then Places a green dot at position (332, 212).
; PLAN: r0=44(x), r1=25(y), r2=73(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=212(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 44
LDI r1, 25
LDI r2, 73
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 212
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
