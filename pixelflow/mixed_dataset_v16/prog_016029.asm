; DESCRIPTION: Draws a green line from (386, 57) to (177, 101).
; PLAN: r0=386(x1), r1=57(y1), r2=177(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 57
LDI r2, 177
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
