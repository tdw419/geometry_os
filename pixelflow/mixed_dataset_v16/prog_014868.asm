; DESCRIPTION: Renders a cyan line between points (372, 210) and (396, 114).
; PLAN: r0=372(x1), r1=210(y1), r2=396(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 210
LDI r2, 396
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
