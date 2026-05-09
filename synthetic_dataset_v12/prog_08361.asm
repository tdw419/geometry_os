; DESCRIPTION: Renders a black box of size 75x40 starting at (284, 185).
; PLAN: r0=284(x), r1=185(y), r2=75(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 185
LDI r2, 75
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
