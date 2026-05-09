; DESCRIPTION: Places a magenta 55x37 rectangle at position (152, 192).
; PLAN: r0=152(x), r1=192(y), r2=55(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 192
LDI r2, 55
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
