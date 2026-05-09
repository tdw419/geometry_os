; DESCRIPTION: Places a green 76x15 rectangle at position (217, 171).
; PLAN: r0=217(x), r1=171(y), r2=76(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 171
LDI r2, 76
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
