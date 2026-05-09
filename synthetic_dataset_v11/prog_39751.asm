; DESCRIPTION: Renders a green box of size 32x50 starting at (69, 188).
; PLAN: r0=69(x), r1=188(y), r2=32(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 188
LDI r2, 32
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
