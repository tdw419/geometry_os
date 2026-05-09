; DESCRIPTION: Renders a cyan line between points (248, 227) and (173, 144).
; PLAN: r0=248(x1), r1=227(y1), r2=173(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 227
LDI r2, 173
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
