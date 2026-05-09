; DESCRIPTION: Draws a cyan line from (198, 69) to (143, 75).
; PLAN: r0=198(x1), r1=69(y1), r2=143(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 69
LDI r2, 143
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
