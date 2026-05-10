; DESCRIPTION: Renders a cyan box of size 103x69 starting at (253, 105).
; PLAN: r0=253(x), r1=105(y), r2=103(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 105
LDI r2, 103
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
