; DESCRIPTION: Draws a cyan line from (198, 180) to (173, 166).
; PLAN: r0=198(x1), r1=180(y1), r2=173(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 180
LDI r2, 173
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
