; DESCRIPTION: Draws a white line from (362, 187) to (313, 69).
; PLAN: r0=362(x1), r1=187(y1), r2=313(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 187
LDI r2, 313
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
