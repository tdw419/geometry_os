; DESCRIPTION: Places a cyan line segment connecting (96, 206) to (128, 255).
; PLAN: r0=96(x1), r1=206(y1), r2=128(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 206
LDI r2, 128
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
