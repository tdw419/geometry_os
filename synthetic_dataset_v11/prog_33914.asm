; DESCRIPTION: Draws a green line from (73, 46) to (48, 199).
; PLAN: r0=73(x1), r1=46(y1), r2=48(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 46
LDI r2, 48
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
