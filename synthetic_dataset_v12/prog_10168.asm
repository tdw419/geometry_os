; DESCRIPTION: Draws a cyan line from (96, 161) to (63, 210).
; PLAN: r0=96(x1), r1=161(y1), r2=63(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 161
LDI r2, 63
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
