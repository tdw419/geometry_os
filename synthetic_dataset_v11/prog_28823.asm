; DESCRIPTION: Places a green 90x76 rectangle at position (92, 95).
; PLAN: r0=92(x), r1=95(y), r2=90(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 95
LDI r2, 90
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
