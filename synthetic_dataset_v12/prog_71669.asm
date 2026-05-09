; DESCRIPTION: Draws a cyan line from (492, 57) to (128, 102).
; PLAN: r0=492(x1), r1=57(y1), r2=128(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 57
LDI r2, 128
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
