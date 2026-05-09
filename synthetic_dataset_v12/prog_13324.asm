; DESCRIPTION: Renders a cyan line between points (58, 139) and (206, 57).
; PLAN: r0=58(x1), r1=139(y1), r2=206(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 139
LDI r2, 206
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
