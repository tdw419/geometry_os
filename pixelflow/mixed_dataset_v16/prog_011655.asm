; DESCRIPTION: Renders a cyan line between points (388, 128) and (36, 87).
; PLAN: r0=388(x1), r1=128(y1), r2=36(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 128
LDI r2, 36
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
