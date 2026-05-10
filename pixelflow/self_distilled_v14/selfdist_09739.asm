; DESCRIPTION: Draws a red line from (354, 27) to (365, 16).
; PLAN: r0=354(x1), r1=27(y1), r2=365(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 27
LDI r2, 365
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
