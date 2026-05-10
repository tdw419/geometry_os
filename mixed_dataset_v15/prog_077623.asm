; DESCRIPTION: Renders a green line between points (250, 151) and (284, 76).
; PLAN: r0=250(x1), r1=151(y1), r2=284(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 151
LDI r2, 284
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
