; DESCRIPTION: Places a red 107x100 rectangle at position (12, 92).
; PLAN: r0=12(x), r1=92(y), r2=107(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 92
LDI r2, 107
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
