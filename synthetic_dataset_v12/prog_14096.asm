; DESCRIPTION: Draws a yellow line from (434, 28) to (509, 161).
; PLAN: r0=434(x1), r1=28(y1), r2=509(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 28
LDI r2, 509
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
