; DESCRIPTION: Places a magenta 22x14 rectangle at position (284, 170).
; PLAN: r0=284(x), r1=170(y), r2=22(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 170
LDI r2, 22
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
