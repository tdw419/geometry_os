; DESCRIPTION: Renders a cyan line between points (454, 128) and (217, 76).
; PLAN: r0=454(x1), r1=128(y1), r2=217(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 128
LDI r2, 217
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
