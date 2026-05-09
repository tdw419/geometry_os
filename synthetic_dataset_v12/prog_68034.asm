; DESCRIPTION: Renders a cyan line between points (442, 86) and (322, 64).
; PLAN: r0=442(x1), r1=86(y1), r2=322(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 86
LDI r2, 322
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
