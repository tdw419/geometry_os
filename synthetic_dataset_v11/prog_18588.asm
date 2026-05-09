; DESCRIPTION: Places a green 47x116 rectangle at position (20, 60).
; PLAN: r0=20(x), r1=60(y), r2=47(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 60
LDI r2, 47
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
