; DESCRIPTION: Renders a cyan line between points (207, 128) and (100, 66).
; PLAN: r0=207(x1), r1=128(y1), r2=100(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 128
LDI r2, 100
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
