; DESCRIPTION: Places a red 84x46 rectangle at position (166, 154).
; PLAN: r0=166(x), r1=154(y), r2=84(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 154
LDI r2, 84
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
