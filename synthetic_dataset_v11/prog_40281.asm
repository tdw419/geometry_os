; DESCRIPTION: Places a magenta 39x86 rectangle at position (49, 154).
; PLAN: r0=49(x), r1=154(y), r2=39(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 154
LDI r2, 39
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
