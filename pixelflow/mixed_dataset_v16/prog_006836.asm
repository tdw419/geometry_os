; DESCRIPTION: Renders a purple box of size 103x94 starting at (284, 148).
; PLAN: r0=284(x), r1=148(y), r2=103(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 148
LDI r2, 103
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
