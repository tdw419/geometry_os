; DESCRIPTION: Draws a green line from (365, 158) to (480, 107).
; PLAN: r0=365(x1), r1=158(y1), r2=480(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 158
LDI r2, 480
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
