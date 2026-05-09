; DESCRIPTION: Draws a cyan line from (329, 177) to (26, 136).
; PLAN: r0=329(x1), r1=177(y1), r2=26(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 177
LDI r2, 26
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
