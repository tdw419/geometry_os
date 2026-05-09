; DESCRIPTION: Renders a cyan line between points (28, 71) and (474, 168).
; PLAN: r0=28(x1), r1=71(y1), r2=474(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 71
LDI r2, 474
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
