; DESCRIPTION: Places a orange 28x71 rectangle at position (175, 117).
; PLAN: r0=175(x), r1=117(y), r2=28(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 117
LDI r2, 28
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
