; DESCRIPTION: Renders a blue box of size 16x35 starting at (394, 54).
; PLAN: r0=394(x), r1=54(y), r2=16(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 54
LDI r2, 16
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
