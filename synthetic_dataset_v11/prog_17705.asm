; DESCRIPTION: Renders a cyan line between points (209, 43) and (222, 247).
; PLAN: r0=209(x1), r1=43(y1), r2=222(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 43
LDI r2, 222
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
