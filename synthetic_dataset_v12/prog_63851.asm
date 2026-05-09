; DESCRIPTION: Places a yellow 67x95 rectangle at position (234, 126).
; PLAN: r0=234(x), r1=126(y), r2=67(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 126
LDI r2, 67
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
