; DESCRIPTION: Draws a cyan line from (214, 161) to (63, 182).
; PLAN: r0=214(x1), r1=161(y1), r2=63(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 161
LDI r2, 63
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
