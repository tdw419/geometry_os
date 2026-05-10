; DESCRIPTION: Renders a cyan line between points (369, 210) and (294, 140).
; PLAN: r0=369(x1), r1=210(y1), r2=294(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 210
LDI r2, 294
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
