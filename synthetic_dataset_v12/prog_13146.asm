; DESCRIPTION: Draws a cyan line from (268, 248) to (200, 231).
; PLAN: r0=268(x1), r1=248(y1), r2=200(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 248
LDI r2, 200
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
