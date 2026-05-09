; DESCRIPTION: Places a red 104x11 rectangle at position (44, 82).
; PLAN: r0=44(x), r1=82(y), r2=104(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 82
LDI r2, 104
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
