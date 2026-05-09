; DESCRIPTION: Draws a cyan line from (67, 214) to (409, 14).
; PLAN: r0=67(x1), r1=214(y1), r2=409(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 214
LDI r2, 409
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
