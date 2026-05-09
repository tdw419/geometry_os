; DESCRIPTION: Renders a white line between points (179, 173) and (32, 159).
; PLAN: r0=179(x1), r1=173(y1), r2=32(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 173
LDI r2, 32
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
