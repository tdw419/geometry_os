; DESCRIPTION: Places a blue line segment connecting (320, 152) to (480, 219).
; PLAN: r0=320(x1), r1=152(y1), r2=480(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 152
LDI r2, 480
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
