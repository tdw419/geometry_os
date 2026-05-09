; DESCRIPTION: Renders a cyan line between points (320, 189) and (65, 21).
; PLAN: r0=320(x1), r1=189(y1), r2=65(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 189
LDI r2, 65
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
