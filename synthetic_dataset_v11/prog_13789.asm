; DESCRIPTION: Renders a cyan line between points (61, 126) and (222, 21).
; PLAN: r0=61(x1), r1=126(y1), r2=222(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 126
LDI r2, 222
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
