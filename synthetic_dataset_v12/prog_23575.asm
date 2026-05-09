; DESCRIPTION: Places a yellow 91x45 rectangle at position (226, 123).
; PLAN: r0=226(x), r1=123(y), r2=91(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 123
LDI r2, 91
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
