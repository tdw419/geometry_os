; DESCRIPTION: Draws a cyan line from (209, 177) to (227, 221).
; PLAN: r0=209(x1), r1=177(y1), r2=227(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 177
LDI r2, 227
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
