; DESCRIPTION: Draws a cyan line from (244, 32) to (170, 67).
; PLAN: r0=244(x1), r1=32(y1), r2=170(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 32
LDI r2, 170
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
