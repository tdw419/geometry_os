; DESCRIPTION: Places a white 72x43 rectangle at position (1, 82).
; PLAN: r0=1(x), r1=82(y), r2=72(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 82
LDI r2, 72
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
