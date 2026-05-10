; DESCRIPTION: Draws a cyan line from (67, 45) to (370, 238).
; PLAN: r0=67(x1), r1=45(y1), r2=370(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 45
LDI r2, 370
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
