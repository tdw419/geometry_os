; DESCRIPTION: Draws a cyan line from (370, 113) to (247, 189).
; PLAN: r0=370(x1), r1=113(y1), r2=247(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 113
LDI r2, 247
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
