; DESCRIPTION: Renders a cyan line between points (379, 111) and (39, 159).
; PLAN: r0=379(x1), r1=111(y1), r2=39(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 111
LDI r2, 39
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
