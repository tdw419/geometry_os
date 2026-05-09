; DESCRIPTION: Places a red 119x80 rectangle at position (164, 82).
; PLAN: r0=164(x), r1=82(y), r2=119(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 82
LDI r2, 119
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
