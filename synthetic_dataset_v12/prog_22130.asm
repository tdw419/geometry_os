; DESCRIPTION: Places a red 55x40 rectangle at position (80, 21).
; PLAN: r0=80(x), r1=21(y), r2=55(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 21
LDI r2, 55
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
