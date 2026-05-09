; DESCRIPTION: Draws a cyan line from (28, 173) to (110, 12).
; PLAN: r0=28(x1), r1=173(y1), r2=110(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 173
LDI r2, 110
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
