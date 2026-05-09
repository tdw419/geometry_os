; DESCRIPTION: Draws a orange line from (362, 163) to (446, 16).
; PLAN: r0=362(x1), r1=163(y1), r2=446(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 163
LDI r2, 446
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
