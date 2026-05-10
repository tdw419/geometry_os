; DESCRIPTION: Places a red 31x20 rectangle at position (92, 24).
; PLAN: r0=92(x), r1=24(y), r2=31(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 24
LDI r2, 31
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
