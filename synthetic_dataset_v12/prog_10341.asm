; DESCRIPTION: Renders a cyan line between points (494, 189) and (412, 140).
; PLAN: r0=494(x1), r1=189(y1), r2=412(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 189
LDI r2, 412
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
