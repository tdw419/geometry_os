; DESCRIPTION: Renders a purple box of size 95x87 starting at (284, 110).
; PLAN: r0=284(x), r1=110(y), r2=95(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 110
LDI r2, 95
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
