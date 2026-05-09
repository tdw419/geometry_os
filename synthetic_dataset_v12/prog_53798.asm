; DESCRIPTION: Renders a green box of size 14x49 starting at (372, 204).
; PLAN: r0=372(x), r1=204(y), r2=14(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 204
LDI r2, 14
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
