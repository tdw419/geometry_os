; DESCRIPTION: Draws a green line from (368, 33) to (361, 192).
; PLAN: r0=368(x1), r1=33(y1), r2=361(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 33
LDI r2, 361
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
