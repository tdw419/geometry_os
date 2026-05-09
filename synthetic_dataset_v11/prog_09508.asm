; DESCRIPTION: Draws a green line from (44, 126) to (126, 82).
; PLAN: r0=44(x1), r1=126(y1), r2=126(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 126
LDI r2, 126
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
