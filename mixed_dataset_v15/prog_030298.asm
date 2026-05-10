; DESCRIPTION: Renders a blue box of size 54x115 starting at (284, 128).
; PLAN: r0=284(x), r1=128(y), r2=54(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 128
LDI r2, 54
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
