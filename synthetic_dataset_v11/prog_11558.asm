; DESCRIPTION: Places a white 80x71 rectangle at position (28, 150).
; PLAN: r0=28(x), r1=150(y), r2=80(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 150
LDI r2, 80
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
