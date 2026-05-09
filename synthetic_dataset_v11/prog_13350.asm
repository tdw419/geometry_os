; DESCRIPTION: Renders a green box of size 40x48 starting at (69, 204).
; PLAN: r0=69(x), r1=204(y), r2=40(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 204
LDI r2, 40
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
