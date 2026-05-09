; DESCRIPTION: Renders a yellow line between points (282, 82) and (268, 107).
; PLAN: r0=282(x1), r1=82(y1), r2=268(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 82
LDI r2, 268
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
