; DESCRIPTION: Renders a cyan line between points (144, 173) and (179, 136).
; PLAN: r0=144(x1), r1=173(y1), r2=179(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 173
LDI r2, 179
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
