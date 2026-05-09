; DESCRIPTION: Places a orange 35x73 rectangle at position (251, 154).
; PLAN: r0=251(x), r1=154(y), r2=35(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 154
LDI r2, 35
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
