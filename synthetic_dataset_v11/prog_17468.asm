; DESCRIPTION: Renders a cyan line between points (233, 107) and (61, 99).
; PLAN: r0=233(x1), r1=107(y1), r2=61(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 107
LDI r2, 61
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
