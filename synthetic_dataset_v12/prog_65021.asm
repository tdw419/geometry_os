; DESCRIPTION: Renders a green box of size 27x114 starting at (440, 60).
; PLAN: r0=440(x), r1=60(y), r2=27(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 60
LDI r2, 27
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
