; DESCRIPTION: Places a green line segment connecting (356, 96) to (320, 143).
; PLAN: r0=356(x1), r1=96(y1), r2=320(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 96
LDI r2, 320
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
