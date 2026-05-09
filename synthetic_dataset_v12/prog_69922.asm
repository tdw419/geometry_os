; DESCRIPTION: Draws a cyan line from (181, 19) to (352, 78).
; PLAN: r0=181(x1), r1=19(y1), r2=352(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 19
LDI r2, 352
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
