; DESCRIPTION: Draws a cyan line from (138, 90) to (58, 36).
; PLAN: r0=138(x1), r1=90(y1), r2=58(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 90
LDI r2, 58
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
