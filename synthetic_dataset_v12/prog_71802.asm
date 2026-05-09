; DESCRIPTION: Places a green 40x116 rectangle at position (39, 72).
; PLAN: r0=39(x), r1=72(y), r2=40(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 72
LDI r2, 40
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
