; DESCRIPTION: Creates a vertical orange gradient from black to orange.
; PLAN: r0=2(x), r1=10(y), r2=0(width), r3=1(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 10
LDI r2, 0
LDI r3, 1
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
