; DESCRIPTION: Composite: Draws a cyan line from (338, 72) to (134, 116) then Places a cyan dot at position (395, 228).
; PLAN: r0=338(x1), r1=72(y1), r2=134(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=228(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 338
LDI r1, 72
LDI r2, 134
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 228
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
