; DESCRIPTION: Draws a cyan line from (115, 32) to (189, 2).
; PLAN: r0=115(x1), r1=32(y1), r2=189(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 32
LDI r2, 189
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
