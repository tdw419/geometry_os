; DESCRIPTION: Places a orange 15x100 rectangle at position (346, 27).
; PLAN: r0=346(x), r1=27(y), r2=15(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 27
LDI r2, 15
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
