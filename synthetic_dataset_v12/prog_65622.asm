; DESCRIPTION: Renders a cyan line between points (213, 62) and (419, 132).
; PLAN: r0=213(x1), r1=62(y1), r2=419(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 62
LDI r2, 419
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
