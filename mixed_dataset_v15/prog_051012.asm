; DESCRIPTION: Renders a green box of size 50x10 starting at (294, 130).
; PLAN: r0=294(x), r1=130(y), r2=50(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 130
LDI r2, 50
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
