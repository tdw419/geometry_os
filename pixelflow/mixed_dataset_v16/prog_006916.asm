; DESCRIPTION: Renders a cyan line between points (52, 243) and (179, 128).
; PLAN: r0=52(x1), r1=243(y1), r2=179(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 243
LDI r2, 179
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
