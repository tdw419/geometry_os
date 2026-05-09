; DESCRIPTION: Renders a cyan line between points (388, 173) and (332, 217).
; PLAN: r0=388(x1), r1=173(y1), r2=332(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 173
LDI r2, 332
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
