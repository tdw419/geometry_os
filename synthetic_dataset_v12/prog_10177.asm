; DESCRIPTION: Places a blue line segment connecting (458, 239) to (113, 180).
; PLAN: r0=458(x1), r1=239(y1), r2=113(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 239
LDI r2, 113
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
