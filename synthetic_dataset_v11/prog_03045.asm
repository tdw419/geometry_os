; DESCRIPTION: Places a red 113x95 rectangle at position (72, 133).
; PLAN: r0=72(x), r1=133(y), r2=113(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 133
LDI r2, 113
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
