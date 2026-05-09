; DESCRIPTION: Renders a white box of size 103x54 starting at (86, 196).
; PLAN: r0=86(x), r1=196(y), r2=103(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 196
LDI r2, 103
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
