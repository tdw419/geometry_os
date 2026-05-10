; DESCRIPTION: Draws a white line from (258, 18) to (434, 215).
; PLAN: r0=258(x1), r1=18(y1), r2=434(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 18
LDI r2, 434
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
