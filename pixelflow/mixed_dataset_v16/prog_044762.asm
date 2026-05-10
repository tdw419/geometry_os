; DESCRIPTION: Places a green 95x69 box at position (214, 200).
; PLAN: r0=214(x), r1=200(y), r2=95(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 200
LDI r2, 95
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
