; DESCRIPTION: Renders a cyan line between points (372, 215) and (253, 153).
; PLAN: r0=372(x1), r1=215(y1), r2=253(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 215
LDI r2, 253
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
