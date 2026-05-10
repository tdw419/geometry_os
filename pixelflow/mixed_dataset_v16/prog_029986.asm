; DESCRIPTION: Draws a cyan line from (434, 51) to (63, 177).
; PLAN: r0=434(x1), r1=51(y1), r2=63(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 51
LDI r2, 63
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
