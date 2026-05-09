; DESCRIPTION: Renders a cyan line between points (72, 54) and (37, 143).
; PLAN: r0=72(x1), r1=54(y1), r2=37(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 54
LDI r2, 37
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
