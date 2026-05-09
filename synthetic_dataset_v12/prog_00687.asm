; DESCRIPTION: Renders a cyan line between points (279, 237) and (467, 12).
; PLAN: r0=279(x1), r1=237(y1), r2=467(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 237
LDI r2, 467
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
