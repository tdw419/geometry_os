; DESCRIPTION: Places a yellow 12x25 rectangle at position (246, 0).
; PLAN: r0=246(x), r1=0(y), r2=12(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 0
LDI r2, 12
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
