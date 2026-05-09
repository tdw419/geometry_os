; DESCRIPTION: Renders a cyan line between points (39, 242) and (52, 57).
; PLAN: r0=39(x1), r1=242(y1), r2=52(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 242
LDI r2, 52
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
