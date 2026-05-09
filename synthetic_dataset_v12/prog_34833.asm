; DESCRIPTION: Renders a blue box of size 96x50 starting at (16, 166).
; PLAN: r0=16(x), r1=166(y), r2=96(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 166
LDI r2, 96
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
