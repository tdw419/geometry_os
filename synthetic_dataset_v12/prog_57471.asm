; DESCRIPTION: Draws a cyan line from (379, 232) to (352, 44).
; PLAN: r0=379(x1), r1=232(y1), r2=352(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 232
LDI r2, 352
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
