; DESCRIPTION: Creates a vertical green gradient from black to green.
; PLAN: r0=7(x), r1=18(y), r2=1(width), r3=0(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 18
LDI r2, 1
LDI r3, 0
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
