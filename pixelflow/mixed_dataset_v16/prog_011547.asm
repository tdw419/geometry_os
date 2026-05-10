; DESCRIPTION: Places a red 26x48 rectangle at position (92, 23).
; PLAN: r0=92(x), r1=23(y), r2=26(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 23
LDI r2, 26
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
