; DESCRIPTION: Draws a cyan line from (308, 173) to (459, 128).
; PLAN: r0=308(x1), r1=173(y1), r2=459(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 173
LDI r2, 459
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
