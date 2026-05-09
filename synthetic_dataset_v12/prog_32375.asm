; DESCRIPTION: Places a red 48x56 rectangle at position (7, 33).
; PLAN: r0=7(x), r1=33(y), r2=48(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 33
LDI r2, 48
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
