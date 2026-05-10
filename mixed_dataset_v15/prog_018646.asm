; DESCRIPTION: Renders a green line between points (281, 31) and (354, 66).
; PLAN: r0=281(x1), r1=31(y1), r2=354(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 31
LDI r2, 354
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
