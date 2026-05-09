; DESCRIPTION: Draws a orange line from (104, 16) to (175, 42).
; PLAN: r0=104(x1), r1=16(y1), r2=175(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 16
LDI r2, 175
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
