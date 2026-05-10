; DESCRIPTION: Draws a cyan line from (413, 185) to (70, 195).
; PLAN: r0=413(x1), r1=185(y1), r2=70(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 185
LDI r2, 70
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
