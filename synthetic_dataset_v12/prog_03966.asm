; DESCRIPTION: Composite: Draws a blue line from (163, 233) to (18, 116) then Places a cyan dot at position (239, 36).
; PLAN: r0=163(x1), r1=233(y1), r2=18(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=36(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 163
LDI r1, 233
LDI r2, 18
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 36
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
