; DESCRIPTION: Draws a cyan line from (310, 21) to (463, 37).
; PLAN: r0=310(x1), r1=21(y1), r2=463(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 21
LDI r2, 463
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
