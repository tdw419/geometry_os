; DESCRIPTION: Places a yellow 68x20 rectangle at position (239, 123).
; PLAN: r0=239(x), r1=123(y), r2=68(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 123
LDI r2, 68
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
