; DESCRIPTION: Places a red 119x111 rectangle at position (116, 82).
; PLAN: r0=116(x), r1=82(y), r2=119(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 82
LDI r2, 119
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
