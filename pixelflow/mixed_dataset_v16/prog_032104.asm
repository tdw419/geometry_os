; DESCRIPTION: Renders a cyan line between points (185, 168) and (209, 247).
; PLAN: r0=185(x1), r1=168(y1), r2=209(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 168
LDI r2, 209
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
