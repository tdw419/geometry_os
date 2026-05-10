; DESCRIPTION: Places a green 111x116 rectangle at position (16, 61).
; PLAN: r0=16(x), r1=61(y), r2=111(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 61
LDI r2, 111
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
