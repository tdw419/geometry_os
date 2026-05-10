; DESCRIPTION: Places a red 67x63 rectangle at position (38, 17).
; PLAN: r0=38(x), r1=17(y), r2=67(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 17
LDI r2, 67
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
