; DESCRIPTION: Places a yellow 67x38 rectangle at position (247, 17).
; PLAN: r0=247(x), r1=17(y), r2=67(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 17
LDI r2, 67
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
