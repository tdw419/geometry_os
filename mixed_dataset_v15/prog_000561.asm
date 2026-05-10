; DESCRIPTION: Renders a white line between points (210, 163) and (320, 29).
; PLAN: r0=210(x1), r1=163(y1), r2=320(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 163
LDI r2, 320
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
