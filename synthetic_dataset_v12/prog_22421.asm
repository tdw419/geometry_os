; DESCRIPTION: Draws a black line from (143, 215) to (345, 177).
; PLAN: r0=143(x1), r1=215(y1), r2=345(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 215
LDI r2, 345
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
