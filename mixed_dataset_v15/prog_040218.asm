; DESCRIPTION: Renders a green box of size 103x81 starting at (277, 1).
; PLAN: r0=277(x), r1=1(y), r2=103(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 1
LDI r2, 103
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
