; DESCRIPTION: Renders a cyan line between points (96, 171) and (156, 71).
; PLAN: r0=96(x1), r1=171(y1), r2=156(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 171
LDI r2, 156
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
