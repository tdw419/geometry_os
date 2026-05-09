; DESCRIPTION: Places a green 35x27 rectangle at position (10, 113).
; PLAN: r0=10(x), r1=113(y), r2=35(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 113
LDI r2, 35
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
