; DESCRIPTION: Places a red 48x77 rectangle at position (224, 116).
; PLAN: r0=224(x), r1=116(y), r2=48(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 116
LDI r2, 48
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
