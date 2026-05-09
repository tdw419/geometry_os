; DESCRIPTION: Places a yellow 67x39 rectangle at position (4, 161).
; PLAN: r0=4(x), r1=161(y), r2=67(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 161
LDI r2, 67
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
