; DESCRIPTION: Renders a cyan line between points (253, 244) and (261, 67).
; PLAN: r0=253(x1), r1=244(y1), r2=261(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 244
LDI r2, 261
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
