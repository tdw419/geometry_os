; DESCRIPTION: Renders a cyan line between points (81, 241) and (168, 0).
; PLAN: r0=81(x1), r1=241(y1), r2=168(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 241
LDI r2, 168
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
