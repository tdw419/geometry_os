; DESCRIPTION: Renders a cyan line between points (178, 236) and (204, 117).
; PLAN: r0=178(x1), r1=236(y1), r2=204(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 236
LDI r2, 204
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
