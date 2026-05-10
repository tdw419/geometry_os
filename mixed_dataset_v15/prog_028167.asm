; DESCRIPTION: Places a red 29x92 rectangle at position (302, 154).
; PLAN: r0=302(x), r1=154(y), r2=29(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 154
LDI r2, 29
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
