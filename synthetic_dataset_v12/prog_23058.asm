; DESCRIPTION: Draws a cyan line from (161, 27) to (64, 9).
; PLAN: r0=161(x1), r1=27(y1), r2=64(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 27
LDI r2, 64
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
