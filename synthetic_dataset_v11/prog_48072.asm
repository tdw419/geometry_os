; DESCRIPTION: Renders a white line between points (174, 222) and (92, 128).
; PLAN: r0=174(x1), r1=222(y1), r2=92(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 222
LDI r2, 92
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
