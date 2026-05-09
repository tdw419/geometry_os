; DESCRIPTION: Renders a green line between points (253, 255) and (168, 103).
; PLAN: r0=253(x1), r1=255(y1), r2=168(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 255
LDI r2, 168
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
