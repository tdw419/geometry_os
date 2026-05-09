; DESCRIPTION: Draws a cyan line from (179, 16) to (365, 58).
; PLAN: r0=179(x1), r1=16(y1), r2=365(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 16
LDI r2, 365
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
