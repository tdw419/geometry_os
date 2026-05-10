; DESCRIPTION: Places a green 116x74 rectangle at position (386, 27).
; PLAN: r0=386(x), r1=27(y), r2=116(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 27
LDI r2, 116
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
