; DESCRIPTION: Draws a yellow line from (394, 107) to (93, 24).
; PLAN: r0=394(x1), r1=107(y1), r2=93(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 107
LDI r2, 93
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
