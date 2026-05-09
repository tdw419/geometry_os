; DESCRIPTION: Draws a cyan line from (330, 67) to (105, 21).
; PLAN: r0=330(x1), r1=67(y1), r2=105(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 67
LDI r2, 105
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
