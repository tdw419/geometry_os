; DESCRIPTION: Places a yellow 71x68 rectangle at position (55, 166).
; PLAN: r0=55(x), r1=166(y), r2=71(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 166
LDI r2, 71
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
