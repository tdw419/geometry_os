; DESCRIPTION: Places a green 116x39 rectangle at position (248, 164).
; PLAN: r0=248(x), r1=164(y), r2=116(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 164
LDI r2, 116
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
