; DESCRIPTION: Renders a cyan line between points (96, 247) and (452, 206).
; PLAN: r0=96(x1), r1=247(y1), r2=452(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 247
LDI r2, 452
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
