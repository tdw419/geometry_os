; DESCRIPTION: Renders a white line between points (255, 99) and (239, 156).
; PLAN: r0=255(x1), r1=99(y1), r2=239(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 99
LDI r2, 239
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
