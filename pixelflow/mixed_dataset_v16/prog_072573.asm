; DESCRIPTION: Draws a cyan line from (196, 135) to (137, 241).
; PLAN: r0=196(x1), r1=135(y1), r2=137(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 135
LDI r2, 137
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
