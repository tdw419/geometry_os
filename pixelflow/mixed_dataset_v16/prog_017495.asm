; DESCRIPTION: Places a red 32x33 rectangle at position (400, 133).
; PLAN: r0=400(x), r1=133(y), r2=32(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 133
LDI r2, 32
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
