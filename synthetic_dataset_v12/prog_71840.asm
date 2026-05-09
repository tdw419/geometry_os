; DESCRIPTION: Draws a cyan line from (91, 177) to (249, 69).
; PLAN: r0=91(x1), r1=177(y1), r2=249(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 177
LDI r2, 249
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
