; DESCRIPTION: Draws a purple line from (352, 239) to (463, 83).
; PLAN: r0=352(x1), r1=239(y1), r2=463(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 239
LDI r2, 463
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
