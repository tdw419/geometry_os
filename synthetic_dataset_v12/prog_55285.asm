; DESCRIPTION: Draws a cyan line from (330, 244) to (194, 117).
; PLAN: r0=330(x1), r1=244(y1), r2=194(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 244
LDI r2, 194
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
