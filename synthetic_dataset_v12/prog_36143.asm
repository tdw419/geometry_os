; DESCRIPTION: Draws a cyan line from (82, 137) to (151, 47).
; PLAN: r0=82(x1), r1=137(y1), r2=151(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 137
LDI r2, 151
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
