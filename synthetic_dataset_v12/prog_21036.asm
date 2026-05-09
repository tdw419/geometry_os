; DESCRIPTION: Renders a cyan line between points (294, 184) and (10, 52).
; PLAN: r0=294(x1), r1=184(y1), r2=10(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 184
LDI r2, 10
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
