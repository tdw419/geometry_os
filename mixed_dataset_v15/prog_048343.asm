; DESCRIPTION: Draws a green line from (295, 39) to (503, 196).
; PLAN: r0=295(x1), r1=39(y1), r2=503(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 39
LDI r2, 503
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
