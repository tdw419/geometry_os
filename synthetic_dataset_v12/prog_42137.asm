; DESCRIPTION: Renders a cyan line between points (259, 255) and (467, 210).
; PLAN: r0=259(x1), r1=255(y1), r2=467(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 255
LDI r2, 467
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
