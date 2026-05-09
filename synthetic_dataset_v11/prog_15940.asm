; DESCRIPTION: Places a magenta 101x17 rectangle at position (154, 236).
; PLAN: r0=154(x), r1=236(y), r2=101(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 236
LDI r2, 101
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
