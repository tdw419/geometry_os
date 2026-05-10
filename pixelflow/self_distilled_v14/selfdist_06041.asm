; DESCRIPTION: Draws a cyan line from (218, 91) to (86, 153).
; PLAN: r0=218(x1), r1=91(y1), r2=86(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 91
LDI r2, 86
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
