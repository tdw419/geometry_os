; DESCRIPTION: Places a red 48x83 rectangle at position (92, 100).
; PLAN: r0=92(x), r1=100(y), r2=48(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 100
LDI r2, 48
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
