; DESCRIPTION: Draws a cyan line from (87, 57) to (138, 157).
; PLAN: r0=87(x1), r1=57(y1), r2=138(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 57
LDI r2, 138
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
