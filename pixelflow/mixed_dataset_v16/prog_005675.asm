; DESCRIPTION: Draws a cyan line from (361, 117) to (237, 231).
; PLAN: r0=361(x1), r1=117(y1), r2=237(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 117
LDI r2, 237
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
