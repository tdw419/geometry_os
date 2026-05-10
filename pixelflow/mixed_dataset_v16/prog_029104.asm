; DESCRIPTION: Draws a black line from (304, 186) to (365, 120).
; PLAN: r0=304(x1), r1=186(y1), r2=365(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 186
LDI r2, 365
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
