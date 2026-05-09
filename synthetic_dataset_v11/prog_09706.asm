; DESCRIPTION: Draws a black line from (173, 177) to (195, 246).
; PLAN: r0=173(x1), r1=177(y1), r2=195(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 177
LDI r2, 195
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
