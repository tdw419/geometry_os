; DESCRIPTION: Renders a cyan line between points (58, 193) and (5, 173).
; PLAN: r0=58(x1), r1=193(y1), r2=5(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 193
LDI r2, 5
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
