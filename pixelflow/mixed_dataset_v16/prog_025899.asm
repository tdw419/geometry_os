; DESCRIPTION: Places a yellow 79x26 rectangle at position (328, 13).
; PLAN: r0=328(x), r1=13(y), r2=79(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 13
LDI r2, 79
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
