; DESCRIPTION: Renders a green box of size 18x32 starting at (452, 209).
; PLAN: r0=452(x), r1=209(y), r2=18(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 209
LDI r2, 18
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
