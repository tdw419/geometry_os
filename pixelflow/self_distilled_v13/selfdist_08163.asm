; DESCRIPTION: Creates a vertical orange gradient from black to orange.
; PLAN: r0=9(x), r1=18(y), r2=28(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 18
LDI r2, 28
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
