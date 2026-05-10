; DESCRIPTION: Draws a cyan line from (371, 46) to (64, 56).
; PLAN: r0=371(x1), r1=46(y1), r2=64(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 46
LDI r2, 64
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
