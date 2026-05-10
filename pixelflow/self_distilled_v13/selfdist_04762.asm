; DESCRIPTION: Draws a cyan line from (62, 67) to (153, 86).
; PLAN: r0=62(x1), r1=67(y1), r2=153(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 67
LDI r2, 153
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
