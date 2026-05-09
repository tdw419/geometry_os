; DESCRIPTION: Renders a cyan line between points (125, 100) and (228, 247).
; PLAN: r0=125(x1), r1=100(y1), r2=228(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 100
LDI r2, 228
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
