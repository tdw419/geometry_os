; DESCRIPTION: Creates a vertical white gradient from black to white.
; PLAN: r0=7(x), r1=10(y), r2=0(width), r3=1(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 10
LDI r2, 0
LDI r3, 1
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
