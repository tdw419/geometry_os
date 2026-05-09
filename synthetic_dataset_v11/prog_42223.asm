; DESCRIPTION: Renders a cyan line between points (113, 29) and (10, 244).
; PLAN: r0=113(x1), r1=29(y1), r2=10(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 29
LDI r2, 10
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
