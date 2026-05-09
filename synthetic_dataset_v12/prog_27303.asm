; DESCRIPTION: Renders a green line between points (305, 61) and (320, 125).
; PLAN: r0=305(x1), r1=61(y1), r2=320(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 61
LDI r2, 320
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
