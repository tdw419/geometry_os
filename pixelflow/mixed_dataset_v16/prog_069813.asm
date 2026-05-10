; DESCRIPTION: Places a white 45x61 rectangle at position (173, 162).
; PLAN: r0=173(x), r1=162(y), r2=45(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 162
LDI r2, 45
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
