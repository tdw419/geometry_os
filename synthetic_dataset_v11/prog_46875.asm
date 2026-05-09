; DESCRIPTION: Renders a cyan line between points (181, 240) and (39, 214).
; PLAN: r0=181(x1), r1=240(y1), r2=39(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 240
LDI r2, 39
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
