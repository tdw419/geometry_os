; DESCRIPTION: Places a yellow 99x96 rectangle at position (152, 13).
; PLAN: r0=152(x), r1=13(y), r2=99(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 13
LDI r2, 99
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
