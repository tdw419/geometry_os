; DESCRIPTION: Draws a green line from (167, 196) to (188, 167).
; PLAN: r0=167(x1), r1=196(y1), r2=188(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 196
LDI r2, 188
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
