; DESCRIPTION: Renders a cyan line between points (353, 28) and (474, 143).
; PLAN: r0=353(x1), r1=28(y1), r2=474(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 28
LDI r2, 474
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
