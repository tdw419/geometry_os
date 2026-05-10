; DESCRIPTION: Renders a cyan line between points (30, 2) and (505, 171).
; PLAN: r0=30(x1), r1=2(y1), r2=505(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 2
LDI r2, 505
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
