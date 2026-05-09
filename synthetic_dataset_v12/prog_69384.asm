; DESCRIPTION: Renders a white line between points (375, 239) and (256, 196).
; PLAN: r0=375(x1), r1=239(y1), r2=256(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 239
LDI r2, 256
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
