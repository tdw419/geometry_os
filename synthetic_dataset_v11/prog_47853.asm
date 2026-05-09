; DESCRIPTION: Places a yellow 55x19 rectangle at position (38, 161).
; PLAN: r0=38(x), r1=161(y), r2=55(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 161
LDI r2, 55
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
