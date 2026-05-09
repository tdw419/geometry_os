; DESCRIPTION: Places a yellow 60x55 rectangle at position (116, 159).
; PLAN: r0=116(x), r1=159(y), r2=60(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 159
LDI r2, 60
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
