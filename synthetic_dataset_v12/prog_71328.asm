; DESCRIPTION: Draws a cyan line from (305, 138) to (463, 44).
; PLAN: r0=305(x1), r1=138(y1), r2=463(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 138
LDI r2, 463
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
