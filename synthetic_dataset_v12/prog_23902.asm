; DESCRIPTION: Draws a black line from (474, 207) to (429, 239).
; PLAN: r0=474(x1), r1=207(y1), r2=429(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 207
LDI r2, 429
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
