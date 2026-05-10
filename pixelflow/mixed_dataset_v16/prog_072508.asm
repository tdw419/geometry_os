; DESCRIPTION: Creates a vertical red gradient from black to red.
; PLAN: r0=4(x), r1=18(y), r2=0(width), r3=0(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 18
LDI r2, 0
LDI r3, 0
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
