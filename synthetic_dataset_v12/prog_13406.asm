; DESCRIPTION: Places a cyan line segment connecting (116, 255) to (329, 244).
; PLAN: r0=116(x1), r1=255(y1), r2=329(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 255
LDI r2, 329
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
