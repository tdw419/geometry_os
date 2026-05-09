; DESCRIPTION: Places a magenta 30x46 rectangle at position (152, 154).
; PLAN: r0=152(x), r1=154(y), r2=30(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 154
LDI r2, 30
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
