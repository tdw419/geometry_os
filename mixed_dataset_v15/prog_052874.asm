; DESCRIPTION: Places a yellow 71x95 rectangle at position (123, 5).
; PLAN: r0=123(x), r1=5(y), r2=71(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 5
LDI r2, 71
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
