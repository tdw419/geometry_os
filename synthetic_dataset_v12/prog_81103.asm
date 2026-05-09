; DESCRIPTION: Renders a cyan line between points (47, 228) and (452, 196).
; PLAN: r0=47(x1), r1=228(y1), r2=452(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 228
LDI r2, 452
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
