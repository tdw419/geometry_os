; DESCRIPTION: Places a red 46x57 rectangle at position (57, 154).
; PLAN: r0=57(x), r1=154(y), r2=46(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 154
LDI r2, 46
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
