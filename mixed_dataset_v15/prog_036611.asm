; DESCRIPTION: Draws a cyan line from (365, 6) to (102, 83).
; PLAN: r0=365(x1), r1=6(y1), r2=102(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 6
LDI r2, 102
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
