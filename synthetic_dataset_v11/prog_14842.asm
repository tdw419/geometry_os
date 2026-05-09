; DESCRIPTION: Renders a cyan line between points (253, 48) and (243, 52).
; PLAN: r0=253(x1), r1=48(y1), r2=243(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 48
LDI r2, 243
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
