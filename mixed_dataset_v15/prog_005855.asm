; DESCRIPTION: Renders a cyan line between points (195, 162) and (426, 209).
; PLAN: r0=195(x1), r1=162(y1), r2=426(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 162
LDI r2, 426
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
