; DESCRIPTION: Draws a red line from (352, 15) to (405, 108).
; PLAN: r0=352(x1), r1=15(y1), r2=405(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 15
LDI r2, 405
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
