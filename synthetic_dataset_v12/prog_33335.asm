; DESCRIPTION: Draws a cyan line from (86, 128) to (200, 173).
; PLAN: r0=86(x1), r1=128(y1), r2=200(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 128
LDI r2, 200
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
