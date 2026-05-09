; DESCRIPTION: Renders a cyan line between points (488, 218) and (195, 207).
; PLAN: r0=488(x1), r1=218(y1), r2=195(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 218
LDI r2, 195
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
