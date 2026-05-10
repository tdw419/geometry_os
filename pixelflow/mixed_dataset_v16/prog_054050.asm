; DESCRIPTION: Renders a cyan line between points (140, 165) and (326, 19).
; PLAN: r0=140(x1), r1=165(y1), r2=326(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 165
LDI r2, 326
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
