; DESCRIPTION: Draws a cyan line from (354, 50) to (409, 152).
; PLAN: r0=354(x1), r1=50(y1), r2=409(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 50
LDI r2, 409
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
