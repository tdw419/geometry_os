; DESCRIPTION: Draws a cyan line from (425, 229) to (161, 92).
; PLAN: r0=425(x1), r1=229(y1), r2=161(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 229
LDI r2, 161
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
