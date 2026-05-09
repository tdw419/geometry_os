; DESCRIPTION: Renders a cyan line between points (74, 147) and (196, 209).
; PLAN: r0=74(x1), r1=147(y1), r2=196(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 147
LDI r2, 196
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
