; DESCRIPTION: Places a yellow 65x79 rectangle at position (198, 22).
; PLAN: r0=198(x), r1=22(y), r2=65(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 22
LDI r2, 65
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
