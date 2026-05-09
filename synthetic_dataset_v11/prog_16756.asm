; DESCRIPTION: Renders a cyan line between points (237, 246) and (184, 255).
; PLAN: r0=237(x1), r1=246(y1), r2=184(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 246
LDI r2, 184
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
