; DESCRIPTION: Places a red line segment connecting (128, 237) to (90, 215).
; PLAN: r0=128(x1), r1=237(y1), r2=90(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 237
LDI r2, 90
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
