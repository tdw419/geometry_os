; DESCRIPTION: Places a magenta 95x69 rectangle at position (242, 60).
; PLAN: r0=242(x), r1=60(y), r2=95(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 60
LDI r2, 95
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
