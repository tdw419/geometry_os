; DESCRIPTION: Renders a cyan line between points (467, 6) and (492, 36).
; PLAN: r0=467(x1), r1=6(y1), r2=492(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 6
LDI r2, 492
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
