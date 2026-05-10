; DESCRIPTION: Draws a cyan line from (162, 180) to (173, 97).
; PLAN: r0=162(x1), r1=180(y1), r2=173(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 180
LDI r2, 173
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
