; DESCRIPTION: Renders a cyan line between points (335, 248) and (168, 31).
; PLAN: r0=335(x1), r1=248(y1), r2=168(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 248
LDI r2, 168
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
