; DESCRIPTION: Renders a cyan line between points (116, 253) and (227, 128).
; PLAN: r0=116(x1), r1=253(y1), r2=227(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 253
LDI r2, 227
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
