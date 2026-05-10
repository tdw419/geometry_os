; DESCRIPTION: Draws a red line from (234, 28) to (67, 107).
; PLAN: r0=234(x1), r1=28(y1), r2=67(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 28
LDI r2, 67
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
