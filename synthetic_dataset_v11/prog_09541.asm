; DESCRIPTION: Renders a white line between points (106, 143) and (198, 166).
; PLAN: r0=106(x1), r1=143(y1), r2=198(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 143
LDI r2, 198
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
