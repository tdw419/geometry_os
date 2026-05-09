; DESCRIPTION: Renders a cyan line between points (126, 168) and (192, 203).
; PLAN: r0=126(x1), r1=168(y1), r2=192(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 168
LDI r2, 192
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
