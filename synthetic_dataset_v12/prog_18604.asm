; DESCRIPTION: Places a green 24x117 rectangle at position (274, 12).
; PLAN: r0=274(x), r1=12(y), r2=24(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 12
LDI r2, 24
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
