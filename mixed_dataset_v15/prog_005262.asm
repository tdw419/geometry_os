; DESCRIPTION: Draws a orange line from (42, 46) to (295, 107).
; PLAN: r0=42(x1), r1=46(y1), r2=295(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 46
LDI r2, 295
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
