; DESCRIPTION: Renders a green line between points (215, 73) and (31, 173).
; PLAN: r0=215(x1), r1=73(y1), r2=31(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 73
LDI r2, 31
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
