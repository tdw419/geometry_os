; DESCRIPTION: Renders a cyan line between points (119, 32) and (198, 246).
; PLAN: r0=119(x1), r1=32(y1), r2=198(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 32
LDI r2, 198
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
