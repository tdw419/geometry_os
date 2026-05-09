; DESCRIPTION: Renders a cyan line between points (450, 237) and (212, 57).
; PLAN: r0=450(x1), r1=237(y1), r2=212(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 237
LDI r2, 212
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
