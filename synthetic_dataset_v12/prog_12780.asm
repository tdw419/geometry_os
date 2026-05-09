; DESCRIPTION: Draws a green line from (281, 167) to (481, 83).
; PLAN: r0=281(x1), r1=167(y1), r2=481(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 167
LDI r2, 481
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
