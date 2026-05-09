; DESCRIPTION: Places a red 48x46 rectangle at position (232, 123).
; PLAN: r0=232(x), r1=123(y), r2=48(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 123
LDI r2, 48
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
