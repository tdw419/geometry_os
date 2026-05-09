; DESCRIPTION: Draws a cyan line from (211, 236) to (120, 246).
; PLAN: r0=211(x1), r1=236(y1), r2=120(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 236
LDI r2, 120
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
