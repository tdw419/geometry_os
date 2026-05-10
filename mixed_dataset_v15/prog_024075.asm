; DESCRIPTION: Renders a green box of size 16x50 starting at (283, 24).
; PLAN: r0=283(x), r1=24(y), r2=16(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 24
LDI r2, 16
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
