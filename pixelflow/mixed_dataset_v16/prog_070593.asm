; DESCRIPTION: Renders a white line segment connecting (173, 187) to (164, 29).
; PLAN: r0=173(x1), r1=187(y1), r2=164(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 187
LDI r2, 164
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
