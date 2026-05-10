; DESCRIPTION: Renders a cyan line between points (484, 68) and (173, 65).
; PLAN: r0=484(x1), r1=68(y1), r2=173(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 68
LDI r2, 173
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
