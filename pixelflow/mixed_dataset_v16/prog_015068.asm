; DESCRIPTION: Places a orange 19x76 rectangle at position (174, 154).
; PLAN: r0=174(x), r1=154(y), r2=19(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 154
LDI r2, 19
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
