; DESCRIPTION: Renders a cyan line between points (396, 78) and (494, 253).
; PLAN: r0=396(x1), r1=78(y1), r2=494(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 78
LDI r2, 494
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
