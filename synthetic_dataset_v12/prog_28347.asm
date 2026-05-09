; DESCRIPTION: Places a magenta 34x21 rectangle at position (82, 130).
; PLAN: r0=82(x), r1=130(y), r2=34(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 130
LDI r2, 34
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
