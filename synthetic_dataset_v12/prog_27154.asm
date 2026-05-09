; DESCRIPTION: Places a blue 91x95 rectangle at position (346, 76).
; PLAN: r0=346(x), r1=76(y), r2=91(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 76
LDI r2, 91
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
