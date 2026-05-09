; DESCRIPTION: Draws a cyan line from (127, 35) to (68, 219).
; PLAN: r0=127(x1), r1=35(y1), r2=68(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 35
LDI r2, 68
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
