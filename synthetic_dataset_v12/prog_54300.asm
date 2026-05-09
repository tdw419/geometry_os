; DESCRIPTION: Draws a cyan line from (332, 180) to (480, 252).
; PLAN: r0=332(x1), r1=180(y1), r2=480(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 180
LDI r2, 480
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
