; DESCRIPTION: Draws a cyan line from (314, 180) to (352, 13).
; PLAN: r0=314(x1), r1=180(y1), r2=352(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 180
LDI r2, 352
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
