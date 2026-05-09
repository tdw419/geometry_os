; DESCRIPTION: Draws a cyan line from (21, 229) to (425, 160).
; PLAN: r0=21(x1), r1=229(y1), r2=425(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 229
LDI r2, 425
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
