; DESCRIPTION: Renders a green line between points (121, 96) and (128, 103).
; PLAN: r0=121(x1), r1=96(y1), r2=128(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 96
LDI r2, 128
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
