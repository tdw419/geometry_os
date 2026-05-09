; DESCRIPTION: Places a red 48x59 rectangle at position (119, 27).
; PLAN: r0=119(x), r1=27(y), r2=48(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 27
LDI r2, 48
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
