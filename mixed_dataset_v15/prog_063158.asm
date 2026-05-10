; DESCRIPTION: Renders a green line between points (91, 214) and (173, 127).
; PLAN: r0=91(x1), r1=214(y1), r2=173(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 214
LDI r2, 173
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
