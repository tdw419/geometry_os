; DESCRIPTION: Draws a cyan line from (189, 99) to (233, 152).
; PLAN: r0=189(x1), r1=99(y1), r2=233(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 99
LDI r2, 233
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
