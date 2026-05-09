; DESCRIPTION: Composite: Draws a cyan line from (193, 239) to (261, 212) then Sets a single yellow pixel at (433, 182).
; PLAN: r0=193(x1), r1=239(y1), r2=261(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=182(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 193
LDI r1, 239
LDI r2, 261
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 182
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
