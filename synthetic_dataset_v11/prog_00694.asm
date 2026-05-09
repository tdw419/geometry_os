; DESCRIPTION: Places a yellow 120x113 rectangle at position (28, 60).
; PLAN: r0=28(x), r1=60(y), r2=120(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 60
LDI r2, 120
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
