; DESCRIPTION: Renders a cyan line between points (451, 144) and (365, 57).
; PLAN: r0=451(x1), r1=144(y1), r2=365(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 144
LDI r2, 365
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
