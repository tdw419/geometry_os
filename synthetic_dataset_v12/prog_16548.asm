; DESCRIPTION: Renders a cyan line between points (28, 27) and (19, 80).
; PLAN: r0=28(x1), r1=27(y1), r2=19(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 27
LDI r2, 19
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
