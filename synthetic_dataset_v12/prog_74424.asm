; DESCRIPTION: Draws a white line from (488, 206) to (423, 231).
; PLAN: r0=488(x1), r1=206(y1), r2=423(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 206
LDI r2, 423
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
