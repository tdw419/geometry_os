; DESCRIPTION: Draws a cyan line from (53, 214) to (117, 112).
; PLAN: r0=53(x1), r1=214(y1), r2=117(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 214
LDI r2, 117
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
