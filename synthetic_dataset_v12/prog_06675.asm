; DESCRIPTION: Draws a cyan line from (18, 51) to (46, 182).
; PLAN: r0=18(x1), r1=51(y1), r2=46(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 51
LDI r2, 46
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
