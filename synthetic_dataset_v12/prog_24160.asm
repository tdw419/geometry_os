; DESCRIPTION: Draws a magenta line from (452, 111) to (352, 104).
; PLAN: r0=452(x1), r1=111(y1), r2=352(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 111
LDI r2, 352
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
