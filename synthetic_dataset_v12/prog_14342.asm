; DESCRIPTION: Places a purple 99x10 rectangle at position (284, 20).
; PLAN: r0=284(x), r1=20(y), r2=99(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 20
LDI r2, 99
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
