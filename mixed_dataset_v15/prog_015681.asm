; DESCRIPTION: Places a green 110x109 rectangle at position (214, 1).
; PLAN: r0=214(x), r1=1(y), r2=110(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 1
LDI r2, 110
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
