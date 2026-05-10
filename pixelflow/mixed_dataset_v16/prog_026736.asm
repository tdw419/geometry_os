; DESCRIPTION: Renders a cyan line between points (219, 67) and (179, 231).
; PLAN: r0=219(x1), r1=67(y1), r2=179(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 67
LDI r2, 179
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
