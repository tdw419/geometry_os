; DESCRIPTION: Draws a cyan line from (96, 172) to (474, 128).
; PLAN: r0=96(x1), r1=172(y1), r2=474(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 172
LDI r2, 474
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
