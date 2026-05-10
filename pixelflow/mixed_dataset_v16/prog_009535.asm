; DESCRIPTION: Places a magenta 82x92 rectangle at position (290, 60).
; PLAN: r0=290(x), r1=60(y), r2=82(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 60
LDI r2, 82
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
