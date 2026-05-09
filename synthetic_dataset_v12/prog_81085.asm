; DESCRIPTION: Renders a cyan line between points (83, 160) and (494, 173).
; PLAN: r0=83(x1), r1=160(y1), r2=494(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 160
LDI r2, 494
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
