; DESCRIPTION: Draws a white line from (248, 82) to (151, 50).
; PLAN: r0=248(x1), r1=82(y1), r2=151(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 82
LDI r2, 151
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
