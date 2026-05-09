; DESCRIPTION: Draws a cyan line from (254, 39) to (160, 152).
; PLAN: r0=254(x1), r1=39(y1), r2=160(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 39
LDI r2, 160
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
