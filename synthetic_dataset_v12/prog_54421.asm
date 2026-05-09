; DESCRIPTION: Places a black line segment connecting (239, 234) to (379, 113).
; PLAN: r0=239(x1), r1=234(y1), r2=379(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 234
LDI r2, 379
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
