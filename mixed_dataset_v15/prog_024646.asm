; DESCRIPTION: Places a green 116x40 rectangle at position (146, 24).
; PLAN: r0=146(x), r1=24(y), r2=116(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 24
LDI r2, 116
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
