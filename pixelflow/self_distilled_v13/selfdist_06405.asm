; DESCRIPTION: Draws a green line from (11, 128) to (59, 177).
; PLAN: r0=11(x1), r1=128(y1), r2=59(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 128
LDI r2, 59
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
