; DESCRIPTION: Renders a green box of size 43x104 starting at (209, 42).
; PLAN: r0=209(x), r1=42(y), r2=43(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 42
LDI r2, 43
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
