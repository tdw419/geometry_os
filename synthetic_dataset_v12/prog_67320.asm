; DESCRIPTION: Draws a white line from (42, 44) to (250, 120).
; PLAN: r0=42(x1), r1=44(y1), r2=250(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 44
LDI r2, 250
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
