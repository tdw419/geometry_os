; DESCRIPTION: Renders a blue line between points (103, 107) and (387, 239).
; PLAN: r0=103(x1), r1=107(y1), r2=387(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 107
LDI r2, 387
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
