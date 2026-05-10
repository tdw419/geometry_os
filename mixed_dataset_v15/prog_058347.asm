; DESCRIPTION: Places a yellow 67x100 rectangle at position (294, 135).
; PLAN: r0=294(x), r1=135(y), r2=67(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 135
LDI r2, 67
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
