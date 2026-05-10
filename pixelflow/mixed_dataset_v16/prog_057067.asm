; DESCRIPTION: Draws a black line from (464, 205) to (352, 53).
; PLAN: r0=464(x1), r1=205(y1), r2=352(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 205
LDI r2, 352
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
