; DESCRIPTION: Renders a yellow line between points (320, 173) and (277, 69).
; PLAN: r0=320(x1), r1=173(y1), r2=277(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 173
LDI r2, 277
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
