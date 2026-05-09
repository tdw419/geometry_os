; DESCRIPTION: Draws a cyan line from (184, 99) to (28, 179).
; PLAN: r0=184(x1), r1=99(y1), r2=28(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 99
LDI r2, 28
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
