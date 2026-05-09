; DESCRIPTION: Draws a cyan line from (166, 152) to (143, 180).
; PLAN: r0=166(x1), r1=152(y1), r2=143(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 152
LDI r2, 143
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
