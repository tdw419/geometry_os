; DESCRIPTION: Renders a cyan line between points (355, 111) and (99, 128).
; PLAN: r0=355(x1), r1=111(y1), r2=99(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 111
LDI r2, 99
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
