; DESCRIPTION: Places a cyan line segment connecting (320, 178) to (114, 252).
; PLAN: r0=320(x1), r1=178(y1), r2=114(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 178
LDI r2, 114
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
