; DESCRIPTION: Renders a cyan line between points (33, 210) and (178, 179).
; PLAN: r0=33(x1), r1=210(y1), r2=178(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 210
LDI r2, 178
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
