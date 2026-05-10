; DESCRIPTION: Places a purple 56x92 rectangle at position (358, 95).
; PLAN: r0=358(x), r1=95(y), r2=56(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 95
LDI r2, 56
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
