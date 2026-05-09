; DESCRIPTION: Places a red 79x49 rectangle at position (92, 195).
; PLAN: r0=92(x), r1=195(y), r2=79(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 195
LDI r2, 79
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
