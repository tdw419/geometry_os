; DESCRIPTION: Places a blue 108x73 box at position (284, 30).
; PLAN: r0=284(x), r1=30(y), r2=108(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 30
LDI r2, 108
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
