; DESCRIPTION: Draws a cyan line from (414, 6) to (497, 236).
; PLAN: r0=414(x1), r1=6(y1), r2=497(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 6
LDI r2, 497
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
