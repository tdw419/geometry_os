; DESCRIPTION: Renders a cyan line between points (452, 235) and (265, 120).
; PLAN: r0=452(x1), r1=235(y1), r2=265(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 235
LDI r2, 265
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
