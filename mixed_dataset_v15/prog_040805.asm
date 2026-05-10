; DESCRIPTION: Renders a green box of size 76x80 starting at (346, 12).
; PLAN: r0=346(x), r1=12(y), r2=76(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 12
LDI r2, 76
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
