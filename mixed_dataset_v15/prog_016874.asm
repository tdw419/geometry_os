; DESCRIPTION: Draws a cyan line from (183, 124) to (276, 159).
; PLAN: r0=183(x1), r1=124(y1), r2=276(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 124
LDI r2, 276
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
