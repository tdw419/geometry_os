; DESCRIPTION: Creates a vertical blue gradient from black to blue.
; PLAN: r0=3(x), r1=18(y), r2=0(width), r3=1(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 18
LDI r2, 0
LDI r3, 1
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
