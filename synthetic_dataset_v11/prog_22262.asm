; DESCRIPTION: Draws a cyan line from (253, 6) to (43, 21).
; PLAN: r0=253(x1), r1=6(y1), r2=43(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 6
LDI r2, 43
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
