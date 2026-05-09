; DESCRIPTION: Renders a white line between points (156, 126) and (82, 126).
; PLAN: r0=156(x1), r1=126(y1), r2=82(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 126
LDI r2, 82
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
