; DESCRIPTION: Renders a cyan line between points (118, 12) and (213, 168).
; PLAN: r0=118(x1), r1=12(y1), r2=213(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 12
LDI r2, 213
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
