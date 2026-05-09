; DESCRIPTION: Draws a cyan line from (205, 229) to (297, 239).
; PLAN: r0=205(x1), r1=229(y1), r2=297(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 229
LDI r2, 297
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
