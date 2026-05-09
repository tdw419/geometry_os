; DESCRIPTION: Places a cyan 116x35 rectangle at position (135, 173).
; PLAN: r0=135(x), r1=173(y), r2=116(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 173
LDI r2, 116
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
