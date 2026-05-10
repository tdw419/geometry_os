; DESCRIPTION: Places a green 49x45 rectangle at position (246, 130).
; PLAN: r0=246(x), r1=130(y), r2=49(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 130
LDI r2, 49
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
