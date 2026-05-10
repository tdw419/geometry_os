; DESCRIPTION: Creates a vertical red gradient from black to red.
; PLAN: r0=9(x), r1=20(y), r2=0(width), r3=1(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 20
LDI r2, 0
LDI r3, 1
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
