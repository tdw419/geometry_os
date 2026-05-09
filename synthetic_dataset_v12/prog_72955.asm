; DESCRIPTION: Draws a white line from (231, 224) to (69, 82).
; PLAN: r0=231(x1), r1=224(y1), r2=69(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 224
LDI r2, 69
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
