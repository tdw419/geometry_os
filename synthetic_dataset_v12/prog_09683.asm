; DESCRIPTION: Draws a white line from (32, 231) to (126, 164).
; PLAN: r0=32(x1), r1=231(y1), r2=126(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 231
LDI r2, 126
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
