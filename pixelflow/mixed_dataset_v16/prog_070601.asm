; DESCRIPTION: Places a red 48x95 rectangle at position (83, 4).
; PLAN: r0=83(x), r1=4(y), r2=48(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 4
LDI r2, 48
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
