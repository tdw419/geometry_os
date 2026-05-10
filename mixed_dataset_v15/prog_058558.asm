; DESCRIPTION: Places a yellow 108x33 rectangle at position (214, 12).
; PLAN: r0=214(x), r1=12(y), r2=108(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 12
LDI r2, 108
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
