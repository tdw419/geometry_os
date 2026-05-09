; DESCRIPTION: Places a white 96x27 rectangle at position (137, 133).
; PLAN: r0=137(x), r1=133(y), r2=96(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 133
LDI r2, 96
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
