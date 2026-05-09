; DESCRIPTION: Renders a cyan line between points (308, 241) and (6, 113).
; PLAN: r0=308(x1), r1=241(y1), r2=6(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 241
LDI r2, 6
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
