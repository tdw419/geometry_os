; DESCRIPTION: Draws a cyan line from (146, 173) to (478, 211).
; PLAN: r0=146(x1), r1=173(y1), r2=478(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 173
LDI r2, 478
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
