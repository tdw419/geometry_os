; DESCRIPTION: Places a magenta 82x91 rectangle at position (12, 68).
; PLAN: r0=12(x), r1=68(y), r2=82(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 68
LDI r2, 82
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
