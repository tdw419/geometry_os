; DESCRIPTION: Draws a cyan line from (86, 15) to (89, 32).
; PLAN: r0=86(x1), r1=15(y1), r2=89(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 15
LDI r2, 89
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
