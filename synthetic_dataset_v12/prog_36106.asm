; DESCRIPTION: Draws a cyan line from (429, 137) to (279, 183).
; PLAN: r0=429(x1), r1=137(y1), r2=279(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 137
LDI r2, 279
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
