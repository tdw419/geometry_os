; DESCRIPTION: Draws a orange line from (284, 71) to (339, 143).
; PLAN: r0=284(x1), r1=71(y1), r2=339(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 71
LDI r2, 339
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
