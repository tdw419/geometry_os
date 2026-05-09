; DESCRIPTION: Places a red 64x72 rectangle at position (142, 177).
; PLAN: r0=142(x), r1=177(y), r2=64(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 177
LDI r2, 64
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
