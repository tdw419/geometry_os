; DESCRIPTION: Renders a black line between points (152, 222) and (173, 209).
; PLAN: r0=152(x1), r1=222(y1), r2=173(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 222
LDI r2, 173
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
