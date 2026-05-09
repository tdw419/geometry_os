; DESCRIPTION: Renders a yellow box of size 103x74 starting at (47, 13).
; PLAN: r0=47(x), r1=13(y), r2=103(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 13
LDI r2, 103
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
