; DESCRIPTION: Draws a cyan line from (168, 98) to (490, 67).
; PLAN: r0=168(x1), r1=98(y1), r2=490(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 98
LDI r2, 490
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
