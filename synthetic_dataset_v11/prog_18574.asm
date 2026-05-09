; DESCRIPTION: Renders a green line between points (151, 57) and (239, 91).
; PLAN: r0=151(x1), r1=57(y1), r2=239(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 57
LDI r2, 239
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
