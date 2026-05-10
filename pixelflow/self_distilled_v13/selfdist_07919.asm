; DESCRIPTION: Draws a cyan line from (343, 99) to (69, 82).
; PLAN: r0=343(x1), r1=99(y1), r2=69(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 99
LDI r2, 69
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
