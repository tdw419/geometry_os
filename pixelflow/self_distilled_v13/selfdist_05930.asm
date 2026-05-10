; DESCRIPTION: Draws a green line from (123, 173) to (183, 98).
; PLAN: r0=123(x1), r1=173(y1), r2=183(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 173
LDI r2, 183
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
