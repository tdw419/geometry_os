; DESCRIPTION: Draws a green line from (57, 203) to (202, 193).
; PLAN: r0=57(x1), r1=203(y1), r2=202(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 203
LDI r2, 202
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
