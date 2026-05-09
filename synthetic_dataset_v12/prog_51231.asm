; DESCRIPTION: Draws a cyan line from (160, 122) to (256, 27).
; PLAN: r0=160(x1), r1=122(y1), r2=256(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 122
LDI r2, 256
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
