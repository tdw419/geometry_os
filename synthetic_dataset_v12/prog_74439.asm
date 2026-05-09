; DESCRIPTION: Draws a cyan line from (117, 161) to (10, 46).
; PLAN: r0=117(x1), r1=161(y1), r2=10(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 161
LDI r2, 10
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
