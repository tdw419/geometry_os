; DESCRIPTION: Renders a cyan line between points (228, 52) and (24, 115).
; PLAN: r0=228(x1), r1=52(y1), r2=24(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 52
LDI r2, 24
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
