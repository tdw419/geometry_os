; DESCRIPTION: Places a red 28x23 rectangle at position (305, 7).
; PLAN: r0=305(x), r1=7(y), r2=28(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 7
LDI r2, 28
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
