; DESCRIPTION: Draws a cyan line from (125, 19) to (214, 79).
; PLAN: r0=125(x1), r1=19(y1), r2=214(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 19
LDI r2, 214
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
