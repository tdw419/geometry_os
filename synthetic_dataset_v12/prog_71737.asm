; DESCRIPTION: Draws a orange line from (365, 173) to (107, 82).
; PLAN: r0=365(x1), r1=173(y1), r2=107(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 173
LDI r2, 107
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
