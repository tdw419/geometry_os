; DESCRIPTION: Draws a cyan line from (137, 210) to (197, 67).
; PLAN: r0=137(x1), r1=210(y1), r2=197(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 210
LDI r2, 197
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
