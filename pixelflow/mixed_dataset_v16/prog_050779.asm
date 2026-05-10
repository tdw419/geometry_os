; DESCRIPTION: Places a orange line segment connecting (28, 197) to (320, 29).
; PLAN: r0=28(x1), r1=197(y1), r2=320(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 197
LDI r2, 320
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
