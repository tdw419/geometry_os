; DESCRIPTION: Places a yellow 61x49 rectangle at position (157, 33).
; PLAN: r0=157(x), r1=33(y), r2=61(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 33
LDI r2, 61
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
